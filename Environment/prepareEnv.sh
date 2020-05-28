#!/bin/sh
kubectl apply -f persistentVolumes/pv_web.yaml
kubectl apply -f persistentVolumes/pvc_web.yaml
kubectl apply -f persistentVolumes/pv_mysql.yaml
kubectl apply -f persistentVolumes/pvc_mysql.yaml
kubectl apply -f php/php_conf.yaml
kubectl apply -f php/php.yaml --record
php_svc=`kubectl get svc | awk '/php-service/ {print $3}'`
template=`cat nginx/nginx_conf.yaml | sed "s/{{php_svc}}/$php_svc/g"`
echo "$template" | kubectl apply -f -
kubectl apply -f nginx/nginx.yaml --record
kubectl apply -f mysql/mysql_conf.yaml
kubectl apply -f mysql/mysql.yaml --record
echo "PHP listening on $php_svc:9000"
mysql_svc=`kubectl get svc | awk '/mysql-service/ {print $3}'`
echo "MYSQL listening on $mysql_svc:3306"
controlp=`kubectl get nodes -o wide | awk '/control-plane/ {print $6}'`
echo "Control plane reachable at address $controlp:31313"
