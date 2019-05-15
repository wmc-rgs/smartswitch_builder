# Use ubuntu 18.04
FROM ubuntu:18.04
# Update repository and and some dev tools
run apt-get -y update && apt-get -y upgrade && apt-get -y install cmake git build-essential net-tools wget
# make all directories
run mkdir -p /root/dev_tools && mkdir -p /root/download
# Clone the STM32 libraries
run git clone --depth 1 https://github.com/nickmolo/STM32F4xx-Libraries.git /root/dev_tools/STM32F4xx-Libraries
# get the gnu arm gcc 7 2017 q4
# and unpack it
run wget https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu-rm/7-2017q4/gcc-arm-none-eabi-7-2017-q4-major-linux.tar.bz2 -P /root/download   && tar -jxf /root/download/gcc-arm-none-eabi-7-2017-q4-major-linux.tar.bz2 -C /root/dev_tools
# remove unwanted libraries from the STM32 
# and the download directory
run rm -rf /root/download /root/dev_tools/STM32F4xx-Libraries/CubeFW /root/dev_tools/STM32F4xx-Libraries/STM32F4xx_DSP_StdPeriph_Lib_V1.4.0  /root/dev_tools/STM32F4xx-Libraries/STM32_USB-Host-Device_Lib_V2.1.0
# set the environment file
run echo export PATH=/root/dev_tools/gcc-arm-none-eabi-7-2017-q4-major/bin:'$PATH'\\nexport FW_SDK=/root/dev_tools/STM32F4xx-Libraries > /root/dev_tools/dev_tools.env 

