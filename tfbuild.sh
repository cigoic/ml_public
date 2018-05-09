#!/bin/bash

# https://gist.github.com/venik/9ba962c8b301b0e21f99884cbd35082f
raw_cpu_flags=`sysctl -a | grep machdep.cpu.features | cut -d ":" -f 2 | tr '[:upper:]' '[:lower:]'`
COPT="--copt=-march=native"

for cpu_feature in $raw_cpu_flags
do
	case "$cpu_feature" in
		"sse4.1" | "sse4.2" | "ssse3" | "fma" | "cx16" | "popcnt" | "maes")
		    COPT+=" --copt=-m$cpu_feature"
		;;
		"avx1.0")
		    COPT+=" --copt=-mavx"
		;;
		*)
			# noop
		;;
	esac
done

bazel clean --async
if [ -e /tmp/tensorflow_pkg ]; then
	rm -rf /tmp/tensorflow_pkg
fi

CC=/usr/local/opt/llvm/bin/clang CXX=/usr/local/opt/llvm/bin/clang++ AR=/usr/local/opt/llvm/bin/llvm-ar NM=/usr/local/opt/llvm/bin/llvm-nm LDFLAGS+=-L/usr/local/opt/tcl-tk/lib CPPFLAGS+=-I/usr/local/opt/tcl-tk/include PKG_CONFIG_PATH=/usr/local/opt/tcl-tk/lib/pkgconfig ./configure

bazel build -c opt $COPT -k --verbose_failures //tensorflow/tools/pip_package:build_pip_package

bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg

#pip install --upgrade /tmp/tensorflow_pkg/`ls /tmp/tensorflow_pkg/ | grep tensorflow`
pip install --ignore-installed --upgrade /tmp/tensorflow_pkg/`ls /tmp/tensorflow_pkg/ | grep tensorflow`
