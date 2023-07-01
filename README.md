# My ZSH Configurations

The configurations are for my macOS workstation and therefore contain some macOS-specific code and commands.

## Quick Start

```sh
# get to the home folder
$ cd
# pull the git repos
$ git clone https://github.com/htr3n/zsh-config.git .zsh-config
# then link the startup files
$ zsh ~/.zsh-config/bootstrap.sh
```

Log out and login again!!!

In case you want to have private setting excluded from public Git repos, just create a file `.private.sh` in the home folder.

## Plugin Management

Instead of manually installing ZSH plugins, I use [Zi](https://wiki.zshell.dev/), which is a continuing work of [zplugin](https://github.com/zdharma/zplugin), with cool Turbo Mode to accelerate the loading and checking of ZSH plugins. Thus, `zi` needs to be installed as well.

```sh
sh -c "$(curl -fsSL get.zshell.dev)" -- -i skip -b main
```

Note that `zi` installation script will automatically add some commands into the end of `.zshrc` to initialise / load `zi`. Nonetheless, `_init.sh` has already the initialisation of `zi`, thus, we should remove or comment the parts added by `zi` installation script.  

If `Zi` is set up properly, you can use many handy commands, for instance, updating all or some plugins with `zi update` , removing a plugin `zi delete plugin_name`.

Some useful ZSH plugins:

* [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
* [zsh-completions](https://github.com/zsh-users/zsh-completions)
* [zsh-history-substring-search](https://github.com/zsh-users/zsh-history-substring-search)
* [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

## Credits

I developed most of the configuration on my own but nevertheless learned a lot from [Oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) and [Prezto](https://github.com/sorin-ionescu/prezto) and many other sources for various settings.

## License

<3 [MIT License](LICENSE.txt).
