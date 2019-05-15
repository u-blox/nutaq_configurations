#!/bin/bash
# Copyright (C) 2018 Nutaq
# LTE-MME Launch Script

DIR=$(dirname $0)

if [ -z "$1" ]; then
	MME_DIR=/root/mme
else
	RELEASE=$1
	echo "Release ${RELEASE} is used..."
    LTE_DIR="/opt/nutaq/picolte/bin/epc"
    MME_DIR=${LTE_DIR}/${RELEASE}
fi

sudo chmod a+x epc/mme-ifup

sudo ${MME_DIR}/lte_init.sh
sudo ${MME_DIR}/ltemme epc/mme.cfg


