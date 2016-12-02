#!/bin/bash

RUST=$1
PAR=$2

if [ -z "$RUST" ]; then RUST='stable'; fi
if [ -z "$PAR" ]; then PAR='stable'; fi

pvers=(
beta
stable
master
)

rvers=(
beta
stable
nightly
)


if ! echo ${rvers[@]} | grep -q -w $RUST; then 
    echo "argument 1 must be beta, stable or nightly";
    exit;
fi

if ! echo ${pvers[@]} | grep -q -w $PAR; then 
    echo "argument 2 must be beta, stable or master";
    exit;
fi

echo "Rust version $RUST" 
echo "Parity version $PAR" 

sudo apt-get update
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo apt-add-repository 'deb https://apt.dockerproject.org/repo ubuntu-xenial main'
sudo apt-get update
sudo apt-cache policy docker-engine
sudo apt-get install -y docker-engine 

sudo docker build -t parityrelease:1.0 . 
sudo docker run parityrelease:1.0 /root/build.sh $RUST $PAR
