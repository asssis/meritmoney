docker stop meritmoney nginx_meritmoney postgres
docker rm meritmoney nginx_meritmoney postgres
docker rmi meritmoney nginx_meritmoney


docker run --name postgres -e POSTGRES_PASSWORD=postgres -d -v="pgdata:/var/lib/postgresql/data" postgres
docker build  -f Dockerfile.rails -t meritmoney:v1 .
docker build  -f Dockerfile.ngninx -t nginx_meritmoney:v1 .


docker run --name meritmoney -d -p 3000:3000 --link postgres meritmoney:v1
docker run --name nginx_meritmoney -d -p 4000:80  --link meritmoney nginx_meritmoney:v1

#docker exec -it meritmoney rails db:migrate
#docker exec -it meritmoney rails db:create

# docker exec -i -t meritmoney /bin/bash
# docker exec -i -t 6af6b0b5eb1c /bin/bash
# docker container prune