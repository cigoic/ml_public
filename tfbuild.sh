#!/bin/bash

# https://gist.github.com/venik/9ba962c8b301b0e21f99884cbd35082f
raw_cpu_flags=`sysctl -a | grep machdep.cpu.features | cut -d ":" -f 2 | tr '[:upper:]' '[:lower:]'`
COPT="--copt=-march=native"

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

#	LDFLAGS+=-L/usr/local/opt/tcl-tk/lib \
#	CPPFLAGS+=-I/usr/local/opt/tcl-tk/include \
#	PKG_CONFIG_PATH=/usr/local/opt/tcl-tk/lib/pkgconfig"

if [ -e /usr/local/opt/llvm ]; then
	echo -e "################################"
	echo -e "######## Build w/ LLVM #########"
	echo -e "################################"
	CC=/usr/local/opt/llvm/bin/clang CXX=/usr/local/opt/llvm/bin/clang++ GXX=/usr/local/opt/llvm/bin/clang++ LD=/usr/local/opt/llvm/bin/llvm-ld AR=/usr/local/opt/llvm/bin/llvm-ar NM=/usr/local/opt/llvm/bin/llvm-nm RANLIB=/usr/local/opt/llvm/bin/llvm-ranlib OBJCOPY=/usr/local/opt/llvm/bin/llvm-objcopy OBJDUMP=/usr/local/opt/llvm/bin/llvm-objdump STRIP=/usr/local/opt/llvm/bin/llvm-strip ./configure

	CC=/usr/local/opt/llvm/bin/clang CXX=/usr/local/opt/llvm/bin/clang++ GXX=/usr/local/opt/llvm/bin/clang++ LD=/usr/local/opt/llvm/bin/llvm-ld AR=/usr/local/opt/llvm/bin/llvm-ar NM=/usr/local/opt/llvm/bin/llvm-nm RANLIB=/usr/local/opt/llvm/bin/llvm-ranlib OBJCOPY=/usr/local/opt/llvm/bin/llvm-objcopy OBJDUMP=/usr/local/opt/llvm/bin/llvm-objdump STRIP=/usr/local/opt/llvm/bin/llvm-strip bazel build -c opt $COPT -k --verbose_failures //tensorflow/tools/pip_package:build_pip_package
else
	./configure
	bazel build -c opt $COPT -k --verbose_failures //tensorflow/tools/pip_package:build_pip_package
fi

bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg

#pip install --upgrade /tmp/tensorflow_pkg/`ls /tmp/tensorflow_pkg/ | grep tensorflow`
pip install --ignore-installed --upgrade /tmp/tensorflow_pkg/`ls /tmp/tensorflow_pkg/ | grep tensorflow`
