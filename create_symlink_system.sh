#!/bin/bash -xe

BASEDIR=$(cd $(dirname $0); pwd)
cd ${BASEDIR}/

ln -s $(readlink -f recreate.sh) /usr/bin/recreate.sh
ln -s $(readlink -f attach.sh) /usr/bin/attach.sh
