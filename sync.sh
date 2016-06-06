#!/bin/bash
cd "$(dirname "$0")"
function syncDotfiles() {
	rsync --exclude ".git" --exclude ".DS_Store" --exclude "*.sh" --exclude "README.md" -a . ~
}
function testSyncDotfiles() {
	rsync --exclude ".git" --exclude ".DS_Store" --exclude "*.sh" --exclude "README.md" -avn . ~
}
if [ "$1" == "--force" -o "$1" == "-f" ]; then
	syncDotfiles
elif [ "$1" == "--test" -o "$1" == "-t" ]; then
	testSyncDotfiles
else
	echo "This will overwrite existing files in your home directory:"
	testSyncDotfiles
	read -p "Are you sure? (y/n) " -n 1
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		echo "synchronizing files..."
		syncDotfiles
	fi
fi
unset syncDotfiles
source ~/.bash_profile