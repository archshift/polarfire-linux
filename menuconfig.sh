#!/bin/bash

set -eou pipefail

SCRIPT_DIR="$(dirname "$0")"

make ARCH=riscv CROSS_COMPILE=riscv64-unknown-linux-gnu- menuconfig
