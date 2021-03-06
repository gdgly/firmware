#bin/bash

ONECLOUD_HOME=/opt/onecloud
cd ${ONECLOUD_HOME}

PROC_ID=`ps -ef|grep "bin/app_service"|grep -v "grep"|awk '{print $2}'`
if [ "${PROC_ID}" != "" ]
then
    kill -9 ${PROC_ID}
fi

DATE_STR=`date +%Y-%m-%d`
LOG_FILE=/opt/onecloud/log/app_service.log.${DATE_STR}

nohup /opt/onecloud/bin/app_service >> ${LOG_FILE} 2>&1 &
