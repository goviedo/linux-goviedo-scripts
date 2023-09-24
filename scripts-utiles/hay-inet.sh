#! /bin/bash

if curl --silent --head http://www.google.com/  |egrep "20[0-9] Found|30[0-9] Found" >/dev/null
then
	echo "INET OK"
else
	echo "NO INET"
fi
