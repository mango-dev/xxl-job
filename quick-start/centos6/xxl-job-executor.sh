#!/bin/bash
#
# xxl-job-executor
#
# chkconfig: 2345 20 80
# description: This starts and stops xxl-job-executor

SERVER_PORT=8081
XXL_JOB_ADMIN_ADDRESS="http://<host>:<port>/xxl-job-admin"
XXL_JOB_EXECUTOR_APPNAME="<executor app name>"
XXL_JOB_EXECUTOR_IP="<local ip>"
XXL_JOB_EXECUTOR_PORT=9999

XXL_JOB_ACCESSTOKEN=""

CURRENTDIR=$(cd `dirname $0`; pwd)
if [ -L $0 ];then
    realpath=`readlink -f $0`
    CURRENTDIR=$(cd `dirname $realpath`; pwd)
fi

XXL_JOB_EXECUTOR_PROG=${CURRENTDIR}/xxl-job-executor-sample-springboot-2.1.0.jar
PIDFILE=${CURRENTDIR}/xxl-job-executor.pid
DAEMON_OUT=${CURRENTDIR}/xxl-job-executor.out

case $1 in
start)
    echo -n "Starting xxl-job-executor ..."
    if [ -f "$PIDFILE" ]; then
        if kill -0 `cat "$PIDFILE"` > /dev/null 2>&1; then
            echo xxl-job-executor already running as process `cat "$PIDFILE"`.
            exit 0
        fi
    fi
    nohup java -jar ${XXL_JOB_EXECUTOR_PROG} "--server.port=${SERVER_PORT}" "--xxl.job.admin.addresses=${XXL_JOB_ADMIN_ADDRESS}" "--xxl.job.executor.appname=${XXL_JOB_EXECUTOR_APPNAME}" "--xxl.job.executor.ip=${XXL_JOB_EXECUTOR_IP}" "--xxl.job.executor.port=${XXL_JOB_EXECUTOR_PORT}" > ${DAEMON_OUT} 2>&1 < /dev/null &
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
    echo -n "Stopping xxl-job-executor ..."
    if [ ! -f "$PIDFILE" ]; then
        echo "no xxl-job-executor to stop (could not find file $PIDFILE)"
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
    status=`nmap -sS 127.0.0.1 -p ${XXL_JOB_EXECUTOR_PORT} | grep open | awk '{print $2}'`
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