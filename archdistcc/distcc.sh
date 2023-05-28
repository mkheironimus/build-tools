#! /bin/bash

if [ -z "${ALLOW}" ] ; then
	_ALLOW='--allow-private'
else
	for ip in ${ALLOW} ; do
		_ALLOW="${_ALLOW} --allow=${ip}"
	done
fi
_LOG='--log-stderr'                                                             
if [ -n "${LOGNAME}" ] ; then                                                   
	_LOG="--log-file=/tmp/${LOGNAME}"
fi                                                                              
exec distccd \
	${_ALLOW} \
	--no-detach \
	--log-level=${LOGLEVEL} \
	${_LOG} \
	--daemon \
	"$@"
