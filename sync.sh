#!/bin/bash
cd "$(dirname "$0")"
git pull
function doIt() {
	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "*.sh" --exclude "README.md" -a . ~
}
function testIt() {
	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "*.sh" --exclude "README.md" -avn . ~
}
if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt
else
	echo "This will overwrite existing files in your home directory:"
	testIt
	read -p "Are you sure? (y/n) " -n 1
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		echo "synchronizing files..."
		doIt
	fi
fi
unset doIt
