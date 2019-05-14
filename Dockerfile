FROM ubuntu:18.04

run apt-get -y update 
run apt-get -y upgrade 
run apt-get -y install cmake git build-essential net-tools wget

run mkdir -p /root/dev_tools
run mkdir -p /root/download
run mkdir -p /root/dev



run git clone --depth 1 https://github.com/nickmolo/STM32F4xx-Libraries.git /root/dev_tools/STM32F4xx-Libraries
run wget https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu-rm/7-2017q4/gcc-arm-none-eabi-7-2017-q4-major-linux.tar.bz2 -P /root/download
run tar -jxf /root/download/gcc-arm-none-eabi-7-2017-q4-major-linux.tar.bz2 -C /root/dev_tools
run rm -rf /root/download

run echo export PATH=/root/dev_tools/gcc-arm-none-eabi-7-2017-q4-major/bin:'$PATH' > /root/dev_tools/dev_tools.env
run echo export FW_SDK=/root/dev_tools/STM32F4xx-Libraries >> /root/dev_tools/dev_tools.env 

