#!/bin/bash

set -eou pipefail

SCRIPT_DIR="$(dirname "$0")"

PATCHES="\
0001-PFSoC-Icicle-kit-Adding-DTS-makefile.patch
0002-clk-microchip-Add-driver-for-Microchip-PolarFire-SoC.patch
0003-PFSoC-MAC-Interface-auto-negotiation.patch
0004-V2-GPIO-Driver-updates-Enabled-MSS-Clock-for-GPIO.patch
0005-Microchip-Adding-I2C-Support-for-the-Polarfire-SoC.patch
0006-iio-adc-pac193x-add-driver-support-for-PAC193x.patch
0007-PCI-microchip-Add-host-driver-for-Microchip-PCIe-con.patch
0008-Add-definition-for-Microchip-PolarFire-SoC.patch
0009-dt-bindings-clk-microchip-Add-Microchip-PolarFire-ho.patch
0010-V5-Adding-Microchip-MUSB-Driver.patch
0011-uio-can-Microchip-PolarFire-add-CAN-support-via-uio.patch
0012-Microsemi-UIO-Fabric-DMA-support.patch
0013-mbox-add-polarfire-soc-system-controller-mailbox.patch
0014-atish_roundup.patch
0015-rng-add-support-for-rng-on-the-polarfire-soc.patch
0016-soc-add-polarfire-soc-system-controller.patch
0017-WIP-system-services-fpga-digest-and-serial-num.patch
0018-Add-Keystone-DMA-memory-initialization.patch
"

for PATCH in $PATCHES; do
    set -x
    git am "$SCRIPT_DIR/patches/$PATCH"
done

cp "$SCRIPT_DIR/patches/icicle-kit-es-a000-microchip.dts" arch/riscv/boot/dts/microchip/
cp "$SCRIPT_DIR/patches/defconfig" .config
