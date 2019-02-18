#! /bin/bash
# @edt ASIX M06 2018-2019
# crear i engegar slapd mb edt.org
#--------------------------------------

/opt/docker/install.sh && echo "Install OK"
/usr/sbin/krb5kdc && echo "krb5kdc OK"
/usr/sbin/kadmind && echo "kadmind OK"

