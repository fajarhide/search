#!/bin/sh

echo; echo "Uninstalling search"
echo; echo; echo -n "Deleting script files..."
if [ -e '/usr/local/sbin/search' ]; then
	rm -f /usr/local/sbin/search
	echo -n ".."
fi
if [ -d '/usr/local/search' ]; then
	rm -rf /usr/local/search
	echo -n ".."
fi

echo "done"
echo; echo "Uninstall complete!"; echo
