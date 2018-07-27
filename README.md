# My ZSH Configurations

## Quick Start

```sh
# get to the home folder
$ cd
# pull the git repos
$ git clone git@github.com:htr3n/zsh-config.git .zsh-config
# then link the startup files
$ sh ~/.zsh-config/bootstrap
```

Log out and login again!!!

In case you want to have private setting excluded from public Git repos, just create a file `.private.sh` in the home folder.

## Plugin Management

Instead of manually installing some ZSH plugins, I use [antibody](https://getantibody.github.io) to manage necessary plugins (some are not working with _antibody_ such as 'fzf', so manual task it is).

Some useful plugins:

* [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
* [zsh-completions](https://github.com/zsh-users/zsh-completions)
* [zsh-history-substring-search](https://github.com/zsh-users/zsh-history-substring-search)
* [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

## Credits

I developed most of the configuration on my own but nevertheless learned a lot from [Oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) and [Prezto](https://github.com/sorin-ionescu/prezto) and many other sources for various settings.

## License

<3 MIT License.
