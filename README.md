# Jason's dotfiles.

This repo contains my personal dotfiles and are heavily based on [paul](https://github.com/paulirish/dotfiles/) and [mathias](https://github.com/mathiasbynens/dotfiles/)'s.

## Some differences

* Sublime 2 as a default editor
* location support [see below]

## install the neccessary apps

My basic setup is captured in `install-deps.sh` which adds homebrew, z, nave, etc.

## private config

Toss it into a file called `.extra` which you do not commit to this repo and just keep in your `~/`

I do some things with my `PATH`, global 'git' configuration, and other *private* exports and shortcuts.

## location config

I added some location capabilities to accomodate the differences between my work and home environments.

You can set your locatioon in a couple ways:

* use `~/.location/setLocation.sh <location>` [*recommended*]
* add `export LOCATION=<location>` to `~/.location/.current`
* invoke `f_setLocation <location>` directly

You can also invoke `lsync`, which will update your environment based on the value stored in `/.current`.

[Note: all this does it source `.<name>`]

`f_setLocation` will look for a `~/.location/.<name>` file, based off the value passed in. For example, you can add a `~/.location/.home` file to change your configuration at home.

If no `.<file>` is available, `.default` will be used instead.

If you want to automate your location switching, use something like [Control Plane](http://www.controlplaneapp.com/) to invoke a script (that updates `.current`, and then just invoke lsync from your terminal.


### Sensible OS X defaults

When setting up a new Mac, you may want to set some sensible OS X defaults:

```bash
./.osx
```

## Similar projects

I recommend getting a [`.jshintrc`](https://github.com/jshint/node-jshint/blob/master/.jshintrc) and [`.editorconfig`](http://editorconfig.org/) defined for all your projects.


## overview of files

#### shell environement
* `.aliases`
* `.bash_profile`
* `.bash_prompt`
* `.bashrc`
* `.exports`
* `.functions`
* `.extra` - not included, explained above
* `.location` - location container
	* `.current` - current location
	* `.<name>` - location specific environment setup for `<name>`
	

#### manual run
* `install-deps.sh` - random apps i need installed
* `.osx` - run on a fresh osx machine
* `.brew` - homebrew intialization

#### git, brah
* `.git`
* `.gitattributes`
* `.gitconfig`
* `.gitignore`

* `.inputrc` - config for bash readline



## Installation

```bash
git clone https://github.com/addyosmani/dotfiles.git && cd dotfiles && ./sync.sh
```

To update later on, just run the sync again.
