#########################################################################
# File Name: start.sh
# Author: clibing
# mail: wmsjhappy@@gmail.com
# Created Time: 四  1/ 7 14:43:41 2021
#########################################################################
#!/bin/bash

# please make redis source. version is latest ok.

redis-server redis6360_0.conf
sleep 3

redis-server redis6361_0.conf --slaveof 127.0.0.1 6360
sleep 3

redis-server redis6362_0.conf --slaveof 127.0.0.1 6360
sleep 3

redis-sentinel sentinel26360_0.conf &
sleep 3

redis-sentinel sentinel26361_0.conf &
sleep 3

redis-sentinel sentinel26362_0.conf &
sleep 3

sleep 3
ps -aef|grep redis-server
ps -aef|grep redis-sentinel
