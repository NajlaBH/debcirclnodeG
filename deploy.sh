#!/bin/bash
docker push bhntools/debcirclnode:latest

ssh deploy@8.218.102.129 << EOF
docker pull bhntools/debcirclnode:latest
docker stop web || true
docker rm web || true
docker rmi bhntools/debcirclnode:current || true
docker tag bhntools/debcirclnode:latest bhntools/circlenode:current
docker run -d --net app --restart always --name web -p 3000:3000 -p 4200:4200 bhntools/debcirclnode:current
EOF
