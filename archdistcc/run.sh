#! /bin/bash
install -d -m 0777 /dev/shm/archdistcc \
&& docker run \
	--rm \
	-v /dev/shm/archdistcc:/tmp \
	--name=archdistcc \
	--publish=3632:3632/tcp \
	mkheironimus/archdistcc:latest \
	"$@"
