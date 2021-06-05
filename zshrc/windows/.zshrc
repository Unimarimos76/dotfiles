source ~/.oh-my-zsh 
# PATHの設定(homebrew+virtualwrapper)
export PATH=/opt/homebrew/bin:/sbin:/bin:/usr/bin:/usr/texbin:$PATH
# 文字コードの設定
export LANG=ja_JP.UTF-8
# 補完機能を有効にする
autoload -U compinit; compinit
# 大文字小文字を区別せず補完する
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# コマンドの履歴を保存するファイル
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt inc_append_history
setopt share_history

# virtualenv の設定
# ~/.zshrc に以下の設定を追加。
# 下記if文で指定した WORKON_HOME に仮想環境が構築される。
# 不要になったらここを削除しよう。
if [ -f /opt/homebrew/bin/virtualenvwrapper.sh ]; then
export WORKON_HOME=$HOME/.virtualenvs
source /opt/homebrew/bin/virtualenvwrapper.sh
fi
#export PATH="$HOME/.rbenv/bin:$PATH"
#eval "$(rbenv init - )"


function peco-history-selection() {
    #BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    BUFFER=`history -n 1 | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    #zle reset-prompt
    zle -R -c
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection

# vcs_infoロード
autoload -Uz vcs_info
# PROMPT変数内で変数参照する
setopt prompt_subst

# vcsの表示
zstyle ':vcs_info:*' formats '%s][* %F{green}%b%f'
zstyle ':vcs_info:*' actionformats '%s][* %F{green}%b%f(%F{red}%a%f)'
# プロンプト表示直前にvcs_info呼び出
precmd() { vcs_info }

PROMPT='[${vcs_info_msg_0_}]:$("dir_name")/%f=>'

dir_name() {
   echo "$PWD" | sed -E 's|/(.)[^/]*|/\1|g'
}

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH=$HOME/local/go/bin:$HOME/go/bin:$PATH
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init -)"
export PATH="/path/to/anaconda/bin:$PATH"
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad
export PATH="/usr/local/opt/m4/bin:$PATH"
export PATH="/usr/local/Cellar/mysql@5.7/5.7.24/bin:$PATH"
export PATH="/usr/local/bin:$PATH"

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
setopt ignore_eof
setopt share_history
setopt hist_ignore_all_dups

#alias drmc='docker rm $(docker ps -a -q)'
#alias drmi='docker rmi -f $(docker images -q -a -f dangling=true)'
alias ll='ls -al'
alias pb='pbcopy'
alias hb='hub browse'
alias glp='git log --oneline --graph --all'
alias vim="nvim"
alias drm='docker rm $(docker ps -aqf "status=exited") 2> /dev/null'
alias drmi='docker rmi $(docker images -aqf "dangling=true") 2> /dev/null'
alias st='~/dotfiles/scripts/start-tmux.sh'



plugins=(git zsh-autosuggestions)

autoload -U compinit && compinit -u


export EDITOR='vim'

## direnv {{{
#eval "$(direnv hook zsh)"
## }}}
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

export PATH="$HOME/.plenv/bin:$PATH"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH="$PATH:/Users/<username>/.composer/vendor/bin"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/usr/local/opt/php@7.2/bin:$PATH"
export PATH="/usr/local/opt/php@7.2/sbin:$PATH"
export PATH="/Users/uni880/.pyenv/versions/anaconda3-5.2.0/lib/python3.6/site-packages:$PATH"

export LANG=ja_JP.UTF-8

