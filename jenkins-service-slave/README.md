# Jenkins Service Slave

Docker container for running a Jenkins slave with a docker-in-docker setup. Installed components include:

- docker (1.7.1)
- docker-compose (1.3.2)
- make

## Running

To run this container you need to mount the host container's docker socket as a volume:

```
docker run -it -v /var/run/docker.sock:/var/run/docker.sock shopkeep/jenkins-service-slave:lateast bash
```
