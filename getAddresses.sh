#!/bin/sh
php_svc=`kubectl get svc | awk '/php-service/ {print $3}'`
echo "PHP listening on $php_svc:9000"
mysql_svc=`kubectl get svc | awk '/mysql-service/ {print $3}'`
echo "MYSQL listening on $mysql_svc:3306"
controlp=`kubectl get nodes -o wide | awk '/control-plane/ {print $6}'`
echo "Control plane reachable at address $controlp:31313"