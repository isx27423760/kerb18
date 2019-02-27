#Version: 0.0.1
#@edt M11 2018-2019
#kerberos base kserver.edt.org
#------------------------------------------
FROM fedora:27
LABEL author="@edt ASIX M11-SAD Curs 2018-2019"
LABEL description="host PAM autenticació AP kerberos IP ldap 2018-2019" 
RUN mkdir /opt/docker
RUN dnf -y install krb5-workstation tree vim procps passwd authconfig pam_krb5 openssh-clients openldap-clients nss-pam-ldapd 
COPY * /opt/docker/
RUN chmod +x /opt/docker/install.sh /opt/docker/startup.sh
WORKDIR /opt/docker
CMD ["/opt/docker/startup.sh"]

