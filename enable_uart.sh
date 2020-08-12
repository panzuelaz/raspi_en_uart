# These 2 function to enable uart on RaspberryPi
if grep -Fxq "core_freq=250" /boot/config.txt; then
    # if found
    echo "Config 'core_freq=250' already exist."
else
    # if not found
    echo "core_freq=250" >> /boot/config.txt
    echo "Added new line: core_freq=250"
fi

sleep 1

if grep -Fxq "enable_uart=1" /boot/config.txt; then
    # if found
    echo "Config 'enable_uart=1' already exist."
else
    # if not found
    echo "enable_uart=1" >> /boot/config.txt
    echo "Added new line: enable_uart=1"
fi

sleep 1

# This function to disable serial console on RaspberryPi
if grep "console=serial0,115200\|console=ttyAMA0,115200" /boot/cmdline.txt; then
    # if found
    sed -i -e 's/\(console=serial0,115200 \|console=ttyAMA0,115200 \)//g' /boot/cmdline.txt
    echo "Serial console disabled."
else
    # if not found
    echo "Serial console already disabled!"
fi

sleep 1

echo "Tasks done!"