FROM ghcr.io/opencyphal/toolshed:ts22.4.5 

# Ade base image reqs

RUN apt-get update && \
    echo 'Etc/UTC' > /etc/timezone && \
    ln -s /usr/share/zoneinfo/Etc/UTC /etc/localtime && \
    apt-get install -y \
    locales \
    sudo \
    tzdata \
    && rm -rf /var/lib/apt/lists/*
RUN locale-gen en_US.UTF-8; dpkg-reconfigure -f noninteractive locales
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN echo 'ALL ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers


# Add packages to build libs

RUN apt-get update &&   \
    apt-get install -y  \
    apt-utils           \
    automake            \
    binutils-dev        \
    bison               \
    build-essential     \
    curl                \
    flex                \
    g++                 \
    g++-multilib        \
    gcc                 \
    gcc-multilib        \
    genromfs            \
    gettext             \
    git                 \
    gnupg2              \
    gperf               \
    gperf               \
    kconfig-frontends   \
    libasound2          \
    libboost-all-dev    \
    libeigen3-dev       \
    libelf-dev          \
    libexpat-dev        \
    libffi-dev          \
    libflann-dev        \
    libgdbm-dev         \
    libgmp-dev          \
    libisl-dev          \
    libmpc-dev          \
    libmpfr-dev         \
    libncurses5-dev     \
    libncursesw5-dev    \
    libnss3-dev         \
    libpcap-dev         \
    libreadline-dev     \
    libssl-dev          \
    libtool             \
    libusb-1.0-0-dev    \
    libvtk7-dev         \
    lsb-release         \
    minicom             \
    nano                \
    picocom             \
    pkg-config          \
    python3-dev         \
    python3-pip         \
    texinfo             \
    u-boot-tools        \
    util-linux          \
    xxd                 \
    zlib1g-dev          \
    && rm -rf /var/lib/apt/lists/* /tmp/apt-packages

# Net utils
RUN apt-get update &&   \
    apt-get install -y  \
    iproute2            \
    iptables            \
    iputils-ping        \
    net-tools           \
    netcat

# USB & st-link utils
RUN apt-get update &&   \
    apt-get install -y  \
    openocd             \
    usbutils

# Debug tools
RUN apt-get update &&   \
    apt-get install -y  \
    gdbserver           \
    gdb-multiarch

# Unit test framework
RUN apt-get update &&       \
    apt-get install -y      \
    catch2

# Cyphal tools
RUN pip install -U nunavut  \
    pip install -U yakut    \
    pip install kconfiglib

# Bash-prompt

COPY bashrc-git-prompt /
RUN cat /bashrc-git-prompt >> /etc/skel/.bashrc && \
    rm /bashrc-git-prompt

# Fix Tilix VTE

RUN curl -L https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh > /bash_git \
    && echo "source /bash_git" >> /etc/skel/.bashrc

# ADE starting

COPY env.sh /etc/profile.d/ade_env.sh
COPY entrypoint /ade_entrypoint
ENTRYPOINT ["/ade_entrypoint"]
CMD ["/bin/sh", "-c", "trap 'exit 147' TERM; tail -f /dev/null & wait ${!}"]

# Building:
# docker build --platform linux/amd64 -t brtcyphal/cyphal_tools:cyphal -t brtcyphal/cyphal_tools:<tag> .

# Pushing:
# docker push brtcyphal/cyphal_tools:<tag>