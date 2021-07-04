docker stop meritmoney nginx_meritmoney postgres
docker rm meritmoney nginx_meritmoney postgres
docker rmi meritmoney:v1 nginx_meritmoney:v1


docker run --name postgres -e POSTGRES_PASSWORD=postgres -d -v="pgdata:/var/lib/postgresql/data" postgres
docker build  -f Dockerfile.rails -t meritmoney:v1 .
docker build  -f Dockerfile.ngninx -t nginx_meritmoney:v1 .


docker run --name meritmoney -d --link postgres meritmoney:v1
docker run --name nginx_meritmoney -d -p 4000:80  --link meritmoney nginx_meritmoney:v1



