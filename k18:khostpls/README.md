# Kerberos khost
## @edt ASIX M11-SAD Curs 2018-2019

**francs2/k18:khostpl** host amb PAM amb autenticació AP de  kerberos i IP de ldap.
  El servidor kerberos al que contacta s'ha de dir *kserver.edt.org*. El servidor ldap
  s'anomena ldap.edt.org. Aquest host es configura amb authconfig .
  
per generar autenticació PAM amb kerberos i ldap cal:

Part Global:
  * instal·lar procs passwd.
  * crear els usuaris i assignar password als locals.
  * un cop fet tot, configurar amb authconfig la autenticació local,
    kerberos i ldap.

Part Ldap:
 * instal·lar openldap-clients nss-pam-ldapd authconfig
 * copiar la configuració client /etc/openldap/ldap.conf.
 * copiar la configuració client /etc/nslcd.
 * copiar la configuració ns /etc/nsswitch.conf.
 * activar el servei nslcd
 * activar el servei nscd

Part Kerberos
 * instal·lar pam_krb5 authconfig
 * copiar /etc/krb5.conf per la configuració client kerberos

Authconfig:
```
authconfig  --enableshadow --enablelocauthorize --enableldap \
            --ldapserver='ldap.edt.org' --ldapbase='dc=edt,dc=org' \
            --enablekrb5 --krb5kdc='kserver.edt.org' \
            --krb5adminserver='kserver.edt.org' --krb5realm='EDT.ORG' \
            --updateall
```

#### Execució:
```
docker run --rm --name ldap.edt.org -h ldap.edt.org --net mynet -d edtasixm06/ldapserver:18group
docker run --rm --name kserver.edt.org -h kserver.edt.org --net mynet -d francs2/k18:kserver
docker run --rm --name khost.edt.org -h khost.edt.org --net mynet -it francs2/k18:khostpl
```

Comprovacio:

```
[root@khost docker]# su - local01
[local01@khost ~]$ su - user01
Password: pere (ldap)
[user01@khost ~]$ 

[local01@khost ~]$ su - pere
Password: kpere (kerberos)
su: warning: cannot change directory to /tmp/home/pere: No such file or directory
[pere@khost ~]$
```
