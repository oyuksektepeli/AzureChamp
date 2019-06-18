docker run -d -p 5432:5432 -v postgres-data:/var/lib/postgresql/data --name postgres1 postgres
docker exec -it postgres1 sh
createdb -U postgres mydb 
psql -U postgres mydb
CREATE TABLE people (id int, name varchar(80));
INSERT INTO people (id,name) VALUES (2, 'Onur');
\q
exit
docker rm -f postgres1
docker volume ls
docker run -d -p 5432:5432 -v postgres-data:/var/lib/postgresql/data --name postgres2 postgres
docker exec -it postgres2 sh
psql -U postgres mydb
SELECT * FROM people;
\q
exit
docker rm -f postgres2
docker volume rm postgres-data

