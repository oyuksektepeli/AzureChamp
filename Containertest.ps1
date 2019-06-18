docker run -d -p 6379:6379 --name redis1 redis
docker ps
docker logs redis1
docker image ls
docker exec -it redis1 sh
ls -al
redis-cli
ping
set name onur
get name
incr counter
incr counter
incr counter
get counter
exit
exit
docker run -it --rm --link redis1:redis --name client1 redis sh
redis-cli -h redis 
get name
get counter
exit
exit
docker ps
docker stop redis1
docker ps -a
docker rm redis1
docker image rm redis
