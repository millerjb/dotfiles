#!/bin/bash
cd "$(dirname "$0")"
function syncDotfiles() {
	rsync --include ".bash*" --include ".git*" --exclude ".git" --include ".*rc" --include ".hushlogin" --include ".aliases" \
	--include ".functions" --include ".exports" --include ".fzf.bash" --include ".vim" -a . ~
}
function testSyncDotfiles() {
	rsync --include ".bash*" --include ".git*" --exclude ".git" --include ".*rc" --include ".hushlogin" --include ".aliases" \
	--include ".functions" --include ".exports" --include ".fzf.bash" --include ".vim" -avn . ~
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