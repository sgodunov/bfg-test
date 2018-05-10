#!/bin/bash

DOCKERFILE="Dockerfile"
DOCKER=`which docker`
DOCKERTAG="bfg-test"
SSHPORT="10022"
HTTPPORT="80"
WSPORT="8081"

function usage
{
	if [ $# -ne 1 ]; then
    	echo "Usage: $0 [start|stop|destroy]"
		echo "	start - build docker image and start container"
		echo "	destroy - stop container and delete docker image"
    	exit 1
	fi
}

if [[ ! -x $DOCKER ]];then
	echo -e "Can't find executable. Please install docker"
	exit 0
fi

case $1 in
	start)
		if [ "`$DOCKER images $DOCKERTAG -q`" == "" ]
		then
			$DOCKER build -t $DOCKERTAG .
			$DOCKER run -d --name $DOCKERTAG -p $SSHPORT:22 -p $HTTPPORT:80 -p $WSPORT:$WSPORT $DOCKERTAG:latest
		fi
		;;
	destroy)
		echo "Stopping container and cleaning up.."
		$DOCKER stop $DOCKERTAG
		$DOCKER rm -v $DOCKERTAG
		$DOCKER rmi $DOCKERTAG
		;;
	*)
		usage
		;;
esac

