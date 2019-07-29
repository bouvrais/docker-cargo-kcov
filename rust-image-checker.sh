#! /bin/bash
printf "Hey"
LATEST=$(curl https://registry.hub.docker.com/v1/repositories/rust/tags)
VERSION=$(echo "$LATEST" |grep -o "\"\([0-9][0-9]*.[0-9][0-9]*\)\"" -- |tail -1 -- |sed 's/"//g')
if [ "$VERSION" != "$(cat current)" ]
then
    echo "$VERSION" >new
    exit 1
fi
exit 0