
#### Execució

```
docker run --rm --name ldap.edt.org -h ldap.edt.org --net mynet -d francs2/ldapserver:18group

docker run --rm --name samba -h samba --net mynet -it francs2/k18:samba 

docker run --rm --name khost.edt.org -h khost.edt.org --net mynet -it francs2/k18:khostpls  #canviar per :18homesamba
```

#### Configuració samba clau

```
[global]
        workgroup = MYGROUP
        server string = Samba Server Version %v
        log file = /var/log/samba/log.%m
        max log size = 50
        security = user
        passdb backend = tdbsam
        load printers = yes
        cups options = raw
[homes]
        comment = Home Directories
        browseable = no
        writable = yes
;       valid users = %S
;       valid users = MYDOMAIN\%S
```


#### Configuració en el hostpam

*/etc/security/pam_mount.conf.xml*
```
<volume user="*" fstype="cifs" server="samba" path="%(USER)"  mountpoint="~/%(USER)" />

```

#### Exemple en el hostpam
```
[root@host docker]# su - local01

[local01@host ~]$ su - anna
pam_mount password:

[anna@host ~]$ ll
total 0
drwxr-xr-x+ 2 anna alumnes 0 Dec 14 20:27 anna

[anna@host ~]$ mount -t cifs
//samba2/anna on /tmp/home/anna/anna type cifs (rw,relatime,vers=1.0,cache=strict,username=anna,domain=,uid=5002,forceuid,gid=600,forcegid,addr=172.21.0.2,unix,posixpaths,serverino,mapposix,acl,rsize=1048576,wsize=65536,echo_interval=60,actimeo=1)
```

