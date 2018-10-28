#!/bin/bash

# https://gist.github.com/venik/9ba962c8b301b0e21f99884cbd35082f
raw_cpu_flags=`sysctl -a | grep machdep.cpu.features | cut -d ":" -f 2 | tr '[:upper:]' '[:lower:]'`
COPT="--copt=-march=native --copt=-Wno-sign-compare"

# Intel Optimzed flags
COPT+=" --config=mkl --copt=-march=sandybridge --copt=-mtune=ivybridge --copt=-O3 --cxxopt=-D_GLIBCXX_USE_CXX11_ABI=0"

# Cutomized
COPT+=" --config=noaws --config=nogcp --config=noignite --config=nokafka"

for cpu_feature in $raw_cpu_flags
do
	case "$cpu_feature" in
		"sse4.1" | "sse4.2" | "ssse3" | "fma" | "cx16" | "popcnt" | "aes")
		    COPT+=" --copt=-m$cpu_feature"
		;;
		"avx1.0")
		    COPT+=" --copt=-mavx"
		    # Flags set in the command below will add AVX, AVX2 and AVX512 instructions which will result in
		    # "illegal instruction" errors when you use older CPUs. If you want to build on older CPUs, 
		    # set the instruction flags accordingly
		    COPT+=" --copt=-mavx2 --copt=-mfma --copt=-mavx512f --copt=-mavx512pf --copt=-mavx512cd --copt=-mavx512er"
		;;
		*)
			# noop
		;;
	esac
done

echo -e "Build w/ the following flags:"
echo $COPT

bazel clean --async
if [ -e /tmp/tensorflow_pkg ]; then
	echo -e "######## Remove /tmp/tensorflow_pkg folder"
	rm -rf /tmp/tensorflow_pkg
fi

## Test source codes
#bazel test -c opt -- //tensorflow/... -//tensorflow/compiler/... -//tensorflow/contrib/lite/...


./configure

# Build the pip package
## Bazel build
if [ -e /usr/local/opt/llvm ]; then
	echo -e "################################"
	echo -e "######## Build w/ LLVM #########"
	PATH2LLVMBIN="/usr/local/opt/llvm/bin"
	export CC=$PATH2LLVMBIN/clang
	export CXX=$CC++
	export GXX=$CXX
	export LD=$PATH2LLVMBIN/ld.lld
	export AR=$PATH2LLVMBIN/llvm-ar 
	export NM=$PATH2LLVMBIN/llvm-nm 
	export RANLIB=$PATH2LLVMBIN/llvm-ranlib 
	export OBJCOPY=$PATH2LLVMBIN/llvm-objcopy 
	export OBJDUMP=$PATH2LLVMBIN/llvm-objdump 
	export STRIP=$PATH2LLVMBIN/llvm-strip
	# if [[ $(eval brew info llvm 2>&1 | grep -c "Built from source on") -eq "1" ]]; then
	export LDFLAGS="-L/usr/local/opt/llvm/lib -Wl,-rpath,/usr/local/opt/llvm/lib"
	export CPPFLAGS="-I/usr/local/opt/llvm/include -I/usr/local/opt/llvm/include/c++/v1/"
	# fi
	#CC=/usr/local/opt/llvm/bin/clang CXX=/usr/local/opt/llvm/bin/clang++ GXX=/usr/local/opt/llvm/bin/clang++ LD=/usr/local/opt/llvm/bin/ld.lld AR=/usr/local/opt/llvm/bin/llvm-ar NM=/usr/local/opt/llvm/bin/llvm-nm RANLIB=/usr/local/opt/llvm/bin/llvm-ranlib OBJCOPY=/usr/local/opt/llvm/bin/llvm-objcopy OBJDUMP=/usr/local/opt/llvm/bin/llvm-objdump STRIP=/usr/local/opt/llvm/bin/llvm-strip ./configure

	#CC=/usr/local/opt/llvm/bin/clang CXX=/usr/local/opt/llvm/bin/clang++ GXX=/usr/local/opt/llvm/bin/clang++ LD=/usr/local/opt/llvm/bin/ld.lld AR=/usr/local/opt/llvm/bin/llvm-ar NM=/usr/local/opt/llvm/bin/llvm-nm RANLIB=/usr/local/opt/llvm/bin/llvm-ranlib OBJCOPY=/usr/local/opt/llvm/bin/llvm-objcopy OBJDUMP=/usr/local/opt/llvm/bin/llvm-objdump STRIP=/usr/local/opt/llvm/bin/llvm-strip 
	bazel build --config=opt $COPT -k --verbose_failures \
		--action_env="CC=${CC}" \
		--action_env="CXX=${CXX}" \
		--action_env="GXX=${GXX}" \
		--action_env="LD=${LD}" \
		--action_env="AR=${AR}" \
		--action_env="NM=${NM}" \
		--action_env="RANLIB=${RANLIB}" \
		--action_env="OBJCOPY=${OBJCOPY}" \
		--action_env="OBJDUMP=${OBJDUMP}" \
		--action_env="STRIP=${STRIP}" \
		--action_env="LDFLAGS=${LDFLAGS}" \
		--action_env="CPPFLAGS=${CPPFLAGS}" \
		//tensorflow/tools/pip_package:build_pip_package
else

	echo -e "################################"
	bazel build -c opt $COPT -k --verbose_failures //tensorflow/tools/pip_package:build_pip_package
fi

# Build the .whl package in /tmp/tensorflow_pkg folder
bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg

#pip install --upgrade /tmp/tensorflow_pkg/`ls /tmp/tensorflow_pkg/ | grep tensorflow`
pip install --ignore-installed --upgrade /tmp/tensorflow_pkg/`ls /tmp/tensorflow_pkg/ | grep tensorflow`
