setenv bootargs console=tty0 root=/dev/${ROOT_DEV} ro rootwait rootfstype=${ROOT_FS} console=ttyS0,115200 earlyprintk
setenv fdt_high 0xffffffff

setenv dtb_list orangepi-zero.dtb

load mmc 0 ${kernel_addr_r} uImage-sun7i-a20-opinicus_v1
for dtb in ${dtb_list}; do
    if load mmc 0 ${fdt_addr_r} ${dtb}; then
        bootm ${kernel_addr_r} - ${fdt_addr_r}
    fi
done
echo "No devicetree found!"
sleep 5
reset
