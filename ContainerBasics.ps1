#To see docker verison
docker verison

#detailed docker information
docker info

#to see local docker images
docker images

#search online images from dockerhub
docker search ubuntu

#download docker image
docker pull ubuntu

#download specific image
docker pull ubuntu:19.10

#create and run container from image 
# 'd' for deattached mode 'it' for interactive mode
docker run -d -p 8080:80 --name ubuntu1 ubuntu
docker run it --name temp ubuntu

#to see container logs
docker logs ubuntu1

#see running containers
docker ps 

#see all containers 
docker ps -a

#stop docker container
docker stop ubuntu1

#delete container 
docker rm ubuntu1

#delete container image
docker rmi ubuntu
docker image rm ubuntu

#inspect docker image
docker inspect ubuntu

#to see docker image history
docker history ubuntu



