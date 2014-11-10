#!/bin/sh
set -e ; set -x

# ---------------------------------------------------------------------------
#
# Hadoop Daemon Users
#

# add daemon users -- stabilize user IDs so that we can persist data dirs
adduser hadoop      --uid 901 --group --system
adduser hdfs        --uid 902 --group --system && usermod -a -G hadoop hdfs
adduser mapred      --uid 903 --group --system && usermod -a -G hadoop mapred
adduser yarn        --uid 904 --group --system && usermod -a -G hadoop yarn
adduser hive        --uid 905 --group --system && usermod -a -G hadoop hive
adduser zookeeper   --uid 906 --group --system && usermod -a -G hadoop zookeeper

# users in this group have root-ish rights on the hdfs
addgroup supergroup --gid 900
