#!/bin/bash

Usage="Usage: start-worker.sh"

if [ "$#" -ne 0 ]; then
  echo $Usage
  exit 1
fi

bin=`cd "$( dirname "$0" )"; pwd`

# Load the Tachyon configuration
. "$bin/tachyon-config.sh"

if [ -e $TACHYON_HOME/conf/tachyon-env.sh ] ; then
  . $TACHYON_HOME/conf/tachyon-env.sh
fi

$bin/mount-ramfs-linux.sh

mkdir -p $TACHYON_HOME/logs

echo "Starting worker @ `hostname`"
#echo "(java -cp $TACHYON_JAR -Dtachyon.home=$TACHYON_HOME -Dtachyon.logger.type="WORKER_LOGGER" -Dlog4j.configuration=file:$TACHYON_HOME/conf/log4j.properties $TACHYON_JAVA_OPTS tachyon.Worker `hostname`) &"
(java -cp $TACHYON_JAR -Dtachyon.home=$TACHYON_HOME -Dtachyon.logger.type="WORKER_LOGGER" -Dlog4j.configuration=file:$TACHYON_HOME/conf/log4j.properties $TACHYON_JAVA_OPTS tachyon.Worker `hostname`) &
