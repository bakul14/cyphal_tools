add-apt-repository ppa:ubuntu-toolchain-r/test -y
apt update -y
apt install -y  \
    gcc-13      \
    g++-13      
update-alternatives --display gcc
update-alternatives --remove-all gcc
update-alternatives --remove-all g++
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-13 10 --slave /usr/bin/g++ g++ /usr/bin/g++-13
