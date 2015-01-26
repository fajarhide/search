#!/bin/sh
if [ -d '/usr/local/search' ]; then
	echo; echo; echo "Please uninstall the previous version first!"
	exit 0
else
	mkdir /usr/local/search
fi
clear

echo; echo 'Installing search 1.0'; echo
echo; echo -n 'Downloading source files...'
wget -q -O /usr/local/search/README https://raw.githubusercontent.com/fajarhide/search/master/README.md
echo -n '.'
wget -q -O /usr/local/search/search.pl https://raw.githubusercontent.com/fajarhide/search/master/search.pl
echo -n '.'
wget -q -O /usr/local/search/uninstall.sh https://raw.githubusercontent.com/fajarhide/search/master/uninstall.sh
chmod 0755 /usr/local/search/search.pl
cp -s /usr/local/search/search.pl /usr/local/sbin/search
echo '... Done!'
cat /usr/local/search/README | less
