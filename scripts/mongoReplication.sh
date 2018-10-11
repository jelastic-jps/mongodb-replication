#!/bin/bash
#master/slave ${nodes.nosqldb[1].address} ${nodes.nosqldb[0].address}

SED=`which sed`
MONGO_CONF_FILE="/etc/mongod.conf"
DB_DATA="/var/lib/mongo"
MONGO_PID=$(ps aux | grep /usr/bin/mongo | grep -v grep | awk '{print $2}')

kill -9 ${MONGO_PID}
sleep 3

if [ "${1}" == "master" ]; then
touch /var/lib/jelastic/keys/1
    mongod --replSet rs0 --config ${MONGO_CONF_FILE} --dbpath ${DB_DATA} --port 27017 &
    #${SED} -ri "s|.*noprealloc.*|noprealloc=true|g" ${MONGO_CONF_FILE}
    #${SED} -ri "s|.*nojournal.*|nojournal=true|g" ${MONGO_CONF_FILE}
    #${SED} -ri "s|.*noauth.*|noauth=true|g" ${MONGO_CONF_FILE}
    sleep 3
MONGOD_PROC=$(netstat -ntl | grep 27017)
#echo ${MONGOD_PROC}
while [ -z "${MONGOD_PROC}"  ]; do
sleep 1;
MONGOD_PROC=$(netstat -ntl | grep 27017)
mongod --replSet rs0 --config ${MONGO_CONF_FILE} --dbpath ${DB_DATA} --port 27017 &
done


mongo << EOF
    rs.initiate({_id:"rs0",members:[{_id:0,host:"${3}:27017"}]});
EOF

sleep 2
mongo<< EOF
    rs.add("${2}");
    cfg=rs.config();
    cfg.members[0].priority=2;
    cfg.members[0].host="${2}"
    rs.reconfig(cfg);
EOF

fi

if [ "${1}" == "slave" ]; then
touch /var/lib/jelastic/keys/1
mongod --replSet rs0 --config /etc/mongod.conf --dbpath ${DB_DATA} --port 27017 &
sleep 2
fi
