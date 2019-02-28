# Kerberos
## @edt ASIX M11-SAD Curs 2018-19

**francs2/k18:kserver** servidor kerberos detach. Crea els usuaris pere
  pau (admin), jordi, anna, marta, marta/admin i julia.
  Assignar-li el nom de host: *kserver.edt.org*

**frans2/k18:khost** host client de kerberos. Simplement amb eines 
  kinit, klist i kdestroy (no pam). El servidor al que contacta s'ha 
  de dir *kserver.edt.org*.

**francs2/k18:sshd** Servidor SSHD *kerberitzat*. Servidor ssh que permet 
  l'accés d'usuaris locals i usuaris locals amb autenticació kerberos. El 
  servidor s'ha de dir sshd.edt.org.

**francs2/k18:khostp** host amb PAM de  kerberos. El servidor al que contacta s'ha
  de dir *kserver.edt.org*. Aquest host configura el *system-auth* de pam per usar el
  mòdul *pam_krb5.so*.

**francs2/k18:khostpl** host amb PAM amb autenticació AP de  kerberos i IP de ldap.
  El servidor kerberos al que contacta s'ha de dir *kserver.edt.org*. El servidor ldap
  s'anomena ldap.edt.org. Aquest host es configura amb authconfig .

Execució:
```
docker netweork create mynet
docker run --rm --name kserver.edt.org -h kserver.edt.org --net mynet -d francs2/k18:kserver
docker run --rm --name sshd.edt.org    -h sshd.edt.org    --net mynet -d francs2/k18:sshd
docker run --rm --name khost -h khost --net mynet -it francs2/k18:khost
```

Execució krb5+ldap:
```
docker netweork create mynet
docker run --rm --name ldap.edt.org -h ldap.edt.org --net mynet -d edtasixm06/ldapserver:18group
docker run --rm --name kserver.edt.org -h kserver.edt.org --net mynet -d francs2/k18:kserver
docker run --rm --name khost.edt.org -h khost.edt.org --net mynet -it francs2/k18:khostpl
```
