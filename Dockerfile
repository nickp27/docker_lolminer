FROM nvidia/cuda:11.1-runtime-ubuntu20.04

MAINTAINER nickp27

WORKDIR /

# Package and dependency setup
RUN apt update -y && apt install -y wget

RUN wget https://github.com/Lolliedieb/lolMiner-releases/releases/download/1.19/lolMiner_v1.19_Lin64.tar.gz \
    tar -xzf lolMiner_v1.19_Lin64.tar.gz && rm lolMiner_v1.18a_Lin64.tar.gz; \
	
RUN mv 1.19/lolMiner ./lolminer \
    chmod +x ./lolminer; \
    cp ./lolminer/usr/local/bin/lolminer

# Env setup
ENV GPU_FORCE_64BIT_PTR=0
ENV GPU_MAX_HEAP_SIZE=100
ENV GPU_USE_SYNC_OBJECTS=1
ENV GPU_MAX_ALLOC_PERCENT=100
ENV GPU_SINGLE_ALLOC_PERCENT=100

ENTRYPOINT ["/usr/local/bin/lolminer"]