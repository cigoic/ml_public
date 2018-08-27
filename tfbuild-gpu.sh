#!/usr/bin/env bash

###############################################################################
# Script Name: tfbuild-gpu.sh
# Description: Build Tensorflow GPU from source on Linux
# Args:
# Author: Jim Chiu
# Source of inspiration
# https://gist.github.com/venik/9ba962c8b301b0e21f99884cbd35082f
###############################################################################

# Detect platform
if [ "$(uname)" == "Darwin" ]; then
	# MacOS
	raw_cpu_flags=`sysctl -a | grep machdep.cpu.features | cut -d ":" -f 2 | tr '[:upper:]' '[:lower:]'`
elif [ "$(uname)" == "Linux" ]; then
	# GNU/Linux
	raw_cpu_flags=`grep flags -m1 /proc/cpuinfo | cut -d ":" -f 2 | tr '[:upper:]' '[:lower:]'`
else
	echo "Unknown plaform: $(uname)"
	exit -1
fi

# Initialize
VENV_BIN=/usr/bin
VENV_LIB=$HOME/.local/lib

# check if VirtuelEnv activated
if [ -z "$VIRTUAL_ENV" ]; then
	echo "VirtualEnv is not activated"
#	exit -1
else
	echo "set up \$VENV_BIN and \$VENV_LIB"
	VENV_BIN=$VIRTUAL_ENV/bin
	VENV_LIB=$VIRTUAL_ENV/lib
fi

if [ -z "$CONDA_DEFAULT_ENV" ]; then
	echo "Conda Env is not activated"
	exit -1
else
	VENV_BIN=$CONDA_PREFIX/bin
	VENV_LIB=$CONDA_PREFIX/lib
	echo "Having Conda Env"
fi

echo "\$VENV_BIN=$VENV_BIN"
echo "\$VENV_LIB=$VENV_LIB"

# bazel tf needs these env vars
export PYTHON_BIN_PATH=$VENV_BIN/python3.6m
export PYTHON_LIB_PATH=$VENV_LIB/python3.6/site-packages
#export PYTHON_LIB_PATH=$VENV_LIB/`ls $VENV_LIB | grep python`/site-packages

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

if [ "$(uname)" == "Linux" ]; then
	rm -rf $HOME/.cache/{bazel, pip}
fi

bazel clean --async
TMP=/tmp CUDA_HOME=/usr/local/cuda-9.2 LD_LIBRARY_PAYH=/usr/local/cuda-9.2/lib64:$LD_LIBRARY_PATH \
./configure

if [ "$?" == 0 ]; then
	TMP=/tmp EN_CUDA="-c cuda" CUDA_HOME=/usr/local/cuda-9.2 LD_LIBRARY_PAYH=/usr/local/cuda-9.2/lib64:$LD_LIBRARY_PATH \
	bazel build -c opt $EN_CUDA --action_env="LD_LIBRARY_PATH=${LD_LIBRARY_PATH}" \
	$COPT -k //tensorflow/tools/pip_package:build_pip_package
else
	echo "***** Fail to build Tensorflow! *****"
	exit $?
fi

bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg
pip install --upgrade /tmp/tensorflow_pkg/`ls /tmp/tensorflow_pkg/ | grep tensorflow`
