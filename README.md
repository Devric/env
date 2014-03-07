# CoreOS Vagrant - http://coreos.com/docs/using-coreos/

## NFS only

```
config.vm.network "private_network", ip: "172.12.8.150"
config.vm.synced_folder ".", "/home/core/share", id: "core", :nfs => true,  :mount_options   => ['nolock,vers=3,udp']
```

## Docker

download the dotcloud docker excuteble to access directly from mac, all ports are mapped

## Docker containers

- run docker container with ports between 49000..49900
- run docker with mounts -v host/guest

eg:

```
docker run -i -p 49800:8000 -v ~/Sites/projects:/www dockerImageName /bin/bash
```

## Docker files

- use entrypoints
