#!/bin/bash

set -eou pipefail

SCRIPT_DIR="$(dirname "$0")"
B=icicle-kit-es

PATCHES="\
    $B/0001-PFSoC-Icicle-kit-Adding-DTS-makefile.patch \
    $B/0001-Microchip-Polarfire-SoC-Clock-Driver.patch \
    $B/0002-PFSoC-MAC-Interface-auto-negotiation.patch \
    0001-V2-GPIO-Driver-updates.patch \
    0003-Microchip-Adding-I2C-Support-for-the-Polarfire-SoC.patch \
    0008-pac139x.patch \
    v11-0004-PCI-microchip-Add-host-driver-for-Microchip-PCIe.patch \
    v1-0002-Add-definition-for-Microchip-PolarFire-SoC.patch \
    v1-0001-dt-bindings-CLK-microchip-Add-Microchip-PolarFire.patch \
    0001-V5-Adding-Microchip-MUSB-Driver.patch \
    0002-uio-can-Microchip-PolarFire-add-CAN-support-via-uio.patch \
    0001-Microsemi-UIO-Fabric-DMA-support.patch \
    $B/0003-mbox-add-polarfire-soc-system-controller-mailbox.patch \
    $B/0002-atish-soc-support.patch \
    $B/0001-rng-add-support-for-rng-on-the-polarfire-soc.patch \
    $B/0005-soc-add-polarfire-soc-system-controller.patch \
    $B/0007-sys-serv-fpga-digest-and-serial-num.patch \
"

for PATCH in $PATCHES; do
    set -x
    git am "$SCRIPT_DIR/patches/$PATCH"
done

cp "$SCRIPT_DIR/patches/$B/icicle-kit-es-a000-microchip.dts" arch/riscv/boot/dts/microchip/
cp "$SCRIPT_DIR/patches/$B/defconfig" .config
