#run container with persistent volume 
docker run -d -p 5432:5432 -v postgres-data:/var/lib/postgresql/data --name postgres1 postgres

#connect to container interactive shell
docker exec -it postgres1 sh

#create db in postgres
createdb -U postgres mydb 

#connect to db in postgres
psql -U postgres mydb

#create table in db
CREATE TABLE people (id int, name varchar(80));

#instert data to table
INSERT INTO people (id,name) VALUES (2, 'Onur');

#quit from postgre connection
\q

#quit from container
exit

#delete container
docker rm -f postgres1

#list volumes
docker volume ls

#run new container with existing volume
docker run -d -p 5432:5432 -v postgres-data:/var/lib/postgresql/data --name postgres2 postgres

#connect to containers interactive shell
docker exec -it postgres2 sh
#connect to postgres 
psql -U postgres mydb
#get data from postgres
SELECT * FROM people;
\q
exit
#delete container
docker rm -f postgres2
#delete volume
docker volume rm postgres-data

