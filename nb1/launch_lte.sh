#!/bin/bash
# Copyright (C) 2018 Nutaq
# LTE-ENB Launch Script

echo "******************************************"
echo "Avaibale releases :"
echo "         R1706 	(2017-06-02)"
echo "         R1710 	(2017-10-13)"
echo "         R1804	(2018-04-01)"
echo "         R1807	(2018-07-10)"
echo "******************************************"


RELEASE_ENB="R1807"
RELEASE_MME="R1807"

WEBGUIPATH=/opt/nutaq/picolte/gui/${RELEASE_ENB}
#'/var/www/html/'$LTE_RELEASE
if [ -d "${WEBGUIPATH}" ]; then 
	if [ -d "/var/www/html/lte" ]; then 
		sudo rm /var/www/html/lte	# Can be rmdir
	fi
	sudo ln -s ${WEBGUIPATH}/www /var/www/html/lte
else
	echo "LTE Web GUI of this release (${LTE_RELEASE}) is not available. Please check and install the required Web GUI."
fi

EPC_SCRIPT=${PWD}/launch_epc.sh
ENB_SCRIPT=${PWD}/launch_enb.sh

SCREEN_SIZE=$(xdpyinfo | grep dimensions | sed -r 's/^[^0-9]*([0-9]+x[0-9]+).*$/\1/')

#gnome-terminal --geometry=${SCREEN_SIZE} --tab --title="EPC" -e "bash -c \"${EPC_SCRIPT}\"" --tab --title="eNodeB" -e "bash -c \"${ENB_SCRIPT};exec bash\"" --tab --title="UL-Perf" --tab --title="DL-Perf""

gnome-terminal --geometry=${SCREEN_SIZE} --tab -e "bash -c \"${EPC_SCRIPT} ${RELEASE_MME};exec bash\"" --tab -e "bash -c \"${ENB_SCRIPT} ${RELEASE_ENB};exec bash\""
