FROM nvidia/cuda:11.1-runtime-ubuntu20.04

MAINTAINER nickp27

WORKDIR /

# Package and dependency setup
RUN apt update -y && apt install -y wget

RUN apt-get purge ocl-icd-opencl-dev; apt-get autoremove; apt-get install ocl-icd-opencl-dev -y

RUN wget https://github.com/Lolliedieb/lolMiner-releases/releases/download/1.19/lolMiner_v1.19_Lin64.tar.gz; \
	tar -xvf lolMiner_v1.19_Lin64.tar.gz; \
	cd /1.19; \
    chmod +x ./lolMiner; \
    cp ./lolMiner /usr/local/bin/lolminer
	
RUN cd /usr/lib/x86_64-linux-gnu/; \
	ln -fs libOpenCL.so.1.0.0 libOpenCL.so


# Env setup
ENV GPU_FORCE_64BIT_PTR=0
ENV GPU_MAX_HEAP_SIZE=100
ENV GPU_USE_SYNC_OBJECTS=1
ENV GPU_MAX_ALLOC_PERCENT=100
ENV GPU_SINGLE_ALLOC_PERCENT=100

ENTRYPOINT ["/usr/local/bin/lolminer"]