#!/bin/bash
docker push bhntools/debcirclnode:latest

ssh deploy@192.30.253.113 << EOF
docker pull bhntools/debcirclnode:latest
docker stop web || true
docker rm web || true
docker rmi bhntools/debcirclnode:current || true
docker tag bhntools/debcirclnode:latest bhntools/debcirclnode:current
docker run -d --net app --restart always --name web -p 3000:3000 -p 4200:4200 bhntools/debcirclnode:current
EOF
