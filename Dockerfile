FROM ubuntu:20.04

ENV DEBIAN_FRONTEND="noninteractive"  TZ=Etc/UTC
RUN apt-get update && apt-get install -y tzdata bash-completion python3-pip openssh-server vim git iputils-ping net-tools iputils-ping \
        bpfcc-tools libbpfcc libbpfcc-dev linux-headers-$(uname -r) binutils libelf1 kmod curl protobuf-compiler \
        && rm -rf /var/lib/apt/lists/* 

#RUN mount -t debugfs none /sys/kernel/debug  

RUN curl -LS https://go.dev/dl/go1.19.5.linux-amd64.tar.gz | tar -xzC /usr/local
ENV PATH="/usr/local/go/bin:${PATH}"

RUN git clone https://github.com/iovisor/bcc.git /root/bcc
RUN pip install numpy \
        && pip install -U scikit-learn \
        && pip install pandas \
        && pip install jupyterlab \
        && pip install matplotlib \
        && pip install pyyaml \
        && pip install "fastapi[all]" \
        && pip install requests \
        && pip install grpcio \
        && pip install grpcio-tools \
        && pip install coloredlogs \
        && pip install dnslib \
        && pip install cachetools
	

COPY exploration  /root/exploration

RUN  mkdir /root/scripts
COPY Dockerfile /root/scripts/Dockerfile
COPY *.sh       /root/scripts/

WORKDIR /root/exploration
