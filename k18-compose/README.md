# Kerberos
## @edt ASIX M11-SAD Curs 2018-2019

**docker-compose.yml**   Engegar com a app els dos serveis conjuntament (kserver i sshd) en una xarxa mynet. Cal
definir apropiadament l'atribut *hostname* per tal de que els containers es trobin.

 
```
docker-compose up -d
Creating network "k18-compose_mynet" with the default driver
Creating kserver.edt.org ... done
Creating sshd.edt.org    ... done

docker ps
CONTAINER ID        IMAGE                    COMMAND                  CREATED             STATUS              PORTS               NAMES
30816d659855        edtasixm11/k18:sshd      "/opt/docker/start..."   31 seconds ago      Up 25 seconds                           sshd.edt.org
4c3f22d1ed94        edtasixm11/k18:kserver   "/opt/docker/start..."   31 seconds ago      Up 26 seconds                           kserver.edt.org

docker network inspect k18-compose_mynet
```
