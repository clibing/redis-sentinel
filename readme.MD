docker network ls | grep -v "NETWORK" | awk '{print $1}' | xargs -I {} docker network inspect {} | grep 172.19

docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}'  redis-master


查看集群 master 与 slaves 信息

# 连接sentinel端口，不是redis的端口
redis-cli -p 26360
sentinel master mymaster
sentinel slaves mymaster

# 连接 redis 端口分别是`6360` `6361` `6362`
查看当前的role分别为master或者slave
`info replication`

# 不要在mac 上使用network_mode=host时，访问端口，此时不通，应该是mac的锅
