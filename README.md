# Personal ZSH Configurations

## Quick Start

```sh
# get to the home folde
$ cd 
# pull the source
$ git clone git@github.com:htr3n/zsh-config.git .zsh-config
# then link the startup files
$ ln -sf ~/.zsh-config/zshenv .zshenv
$ ln -sf ~/.zsh-config/zlogin .zlogin
$ ln -sf ~/.zsh-config/zshrc .zshrc
$ ln -sf ~/.zsh-config/zprofile .zprofile
```

Log out and login again!!!

In case you want to have private setting excluded from the public Git repos, just create a file `.private.sh` in the home folder.

## Credits
I developed most of the configuration on my own but learned a lot from [Oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) and [Prezto](https://github.com/sorin-ionescu/prezto) for defining start-up scripts and many other sources for various settings.
