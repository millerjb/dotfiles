# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && source "$file"
done
unset file

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults

complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | grep -v "\["`;)" ssh

if [ -f '/usr/local/share/bash-completion/bash_completion' ]; then
  . /usr/local/share/bash-completion/bash_completion
fi

if [ -d '/usr/local/opt/nvm' ]; then
  export NVM_DIR=~/.nvm;
  source /usr/local/opt/nvm/nvm.sh;
fi

# adds npm completion
. <(npm completion)

# fzf completion
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

eval $(/usr/libexec/path_helper -s)

export PATH="$PATH:$HOME/.yarn/bin"
export PATH="/usr/local/opt/openssl/bin:$PATH"
