#!/bin/bash
#
# xxl-job-admin
#
# chkconfig: 2345 20 80
# description: This starts and stops xxl-job-admin

SERVER_PORT=8080
SERVER_CONTEXT_PATH="/xxl-job-admin"
DATASOURCE_URL="jdbc:mysql://<host>:<port>/<db>?Unicode=true&characterEncoding=UTF-8"
DATASOURCE_USERNAME="<DB User>"
DATASOURCE_PASSWORD="<DB Passwd>"
XXL_JOB_ACCESSTOKEN=""

CURRENTDIR=$(cd `dirname $0`; pwd)
if [ -L $0 ];then
    realpath=`readlink -f $0`
    CURRENTDIR=$(cd `dirname $realpath`; pwd)
fi

XXL_JOB_ADMIN_PROG=${CURRENTDIR}/xxl-job-admin-2.1.0.jar
PIDFILE=${CURRENTDIR}/xxl-job-admin.pid
DAEMON_OUT=${CURRENTDIR}/xxl-job-admin.out

case $1 in
start)
    echo -n "Starting xxl-job-admin ..."
    if [ -f "$PIDFILE" ]; then
        if kill -0 `cat "$PIDFILE"` > /dev/null 2>&1; then
            echo xxl-job-admin already running as process `cat "$PIDFILE"`.
            exit 0
        fi
    fi
    nohup java -jar ${XXL_JOB_ADMIN_PROG} "--server.port=${SERVER_PORT}" "--server.context-path=${SERVER_CONTEXT_PATH}" "--spring.datasource.url=${DATASOURCE_URL}" "--spring.datasource.username=${DATASOURCE_USERNAME}" "--spring.datasource.password=${DATASOURCE_PASSWORD}" > ${DAEMON_OUT} 2>&1 < /dev/null &
    echo -n $! > "$PIDFILE"
    if [ $? -eq 0 ]; then
        sleep 1
        echo STARTED
    else
        echo SERVER DID NOT START
        exit 1
    fi
    ;;
stop)
    echo -n "Stopping xxl-job-admin ..."
    if [ ! -f "$PIDFILE" ]; then
        echo "no xxl-job-admin to stop (could not find file $PIDFILE)"
    else
        kill -9 $(cat "$PIDFILE")
        rm "$PIDFILE"
        echo STOPPED
    fi
    ;;
restart)
    shift
    "$0" stop ${@}
    sleep 3
    "$0" start ${@}
    ;;
status)
    status=`nmap -sS 127.0.0.1 -p ${SERVER_PORT} | grep open | awk '{print $2}'`
    if [ "$status" == "open" ];then
        echo "running pid: `cat ${PIDFILE}`"
        exit 0
    else
        echo "dead"
        exit 1
    fi
    ;;
*)
    echo "Usage:$0 {start|stop|restart|status} >&2"
esac