FROM ubuntu:20.04

# To avoid this data-enter request, especially when such build is running on CI like Jenkins 
ENV TZ=Europe/Stockholm
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Intall basic utilities
RUN apt-get update && apt-get install -y \
    man-db \
 && rm -rf /var/lib/apt/lists/*

# Install Buildroot Mandatory packages
RUN apt-get update && apt-get install -y \
    sed \
    make \
    binutils \
    gcc \
    g++ \
    bash \
    patch \
    gzip \
    bzip2 \
    perl \
    tar \
    cpio \
    unzip \
    rsync \
    file \
    bc \
    wget \
 && rm -rf /var/lib/apt/lists/*

 # Install Buildroot optional packages

 RUN apt-get update && apt-get install -y \
    python \
    # ncurses5 to use the menuconfig interface
    libncurses5-dev \
    libncursesw5-dev \
    # Source fetching tools:
    git \
    # Documentation generation tools:
    asciidoc \
    w3m \
    dblatex \
    # Graph generation tools:
    graphviz \
    python3-matplotlib \
 && rm -rf /var/lib/apt/lists/*