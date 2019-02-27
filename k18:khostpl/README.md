# Kerberos Host 
## @edt ASIX M11-SAD Curs 2018-2019

**francs1/k18:khostpl** host amb PAM amb autenticació AP de  kerberos i IP de ldap.
  El servidor kerberos al que contacta s'ha de dir *kserver.edt.org*. El servidor ldap
  s'anomena ldap.edt.org. Aquest host es configura amb authconfig .
  
per generar autenticació PAM amb kerberos i ldap cal:

 * instal·lar pam_krb5, openldap-client i authconfig
 * configurar /etc/pam.d/system-auth per fer ús del mòdul pam_krb5.so


Execució:
```
docker run --rm --name ldap.edt.org -h ldap.edt.org --net mynet -d edtasixm06/ldapserver:18group
docker run --rm --name khost.edt.org -h khost.edt.org --network mynet -it francs2/k18:khostpl

```
