#! /bin/bash
# @edt ASIX M06 2018-2019
# crear i engegar host client
#--------------------------------------

/opt/docker/install.sh && echo "Install OK"
/usr/sbin/nslcd && echo "nslcd Ok"
/usr/sbin/nscd && echo "nscd Ok"

/bin/bash

