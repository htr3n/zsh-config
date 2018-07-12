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

```
MIT License

Copyright (c) 2018 Huy Tran

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```