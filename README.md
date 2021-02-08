# docker_lolminer
This is an (early) work in progress docker of lolminer from https://github.com/Lolliedieb/lolMiner-releases

I am currently running this on UnRaid (on 6.9RC1) with --runtime=nvidia and the usage and CMD options the same as the standalone version of the miner.

I have played around the OpenCL install to prevent errors cropping up or no GPU being recognised which I have noticed with other lolminer docker installs.

To do:

 - amend the Dockerfile to allow for rolling updates
 - provide for environmental variables rather than manual input of algo and pool options
 - compile an UnRaid template
 - currently testing a nvidia-settings install to allow for underclocking and fan control

Docker Hub link:https://hub.docker.com/repository/docker/akkipro27/docker_lolminer
