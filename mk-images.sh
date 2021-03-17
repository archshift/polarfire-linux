#!/bin/bash

set -eou pipefail

SCRIPT_DIR="$(dirname "$0")"
JOBS=-j12

make ARCH=riscv CROSS_COMPILE=riscv64-unknown-linux-gnu- $JOBS
make ARCH=riscv CROSS_COMPILE=riscv64-unknown-linux-gnu- microchip/icicle-kit-es-a000-microchip.dtb

mkimage -T script -C none -d "$SCRIPT_DIR/boot.scr" -n 'U-boot boot script' boot.scr.uimg
mkimage -f "$SCRIPT_DIR/fitImage.its" fitImage 
