FROM nvidia/cuda:11.1.1-runtime-ubuntu20.04

MAINTAINER nickp27

WORKDIR /

# Package and dependency setup
RUN apt update -y && apt install -y wget

RUN apt-get install ocl-icd-opencl-dev nvidia-opencl-dev  --no-install-recommends -y && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/Lolliedieb/lolMiner-releases/releases/download/1.20/lolMiner_v1.20_Lin64.tar.gz; \
	tar -xvf lolMiner_v1.20_Lin64.tar.gz; \
	cd /1.20; \
    chmod +x ./lolMiner; \
    cp ./lolMiner /usr/local/bin/lolminer
	
# Env setup
ENV GPU_FORCE_64BIT_PTR=0
ENV GPU_MAX_HEAP_SIZE=100
ENV GPU_USE_SYNC_OBJECTS=1
ENV GPU_MAX_ALLOC_PERCENT=100
ENV GPU_SINGLE_ALLOC_PERCENT=100

ENTRYPOINT ["/usr/local/bin/lolminer"]