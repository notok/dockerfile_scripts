#!/bin/bash -xe

BASEDIR=$(cd $(dirname $0); pwd)
cd ${BASEDIR}/

ln -s -r $(readlink -f recreate.sh) ../recreate.sh
ln -s -r $(readlink -f attach.sh) ../attach.sh
