source ~/.oh-my-zshrc 
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

# virtualenv の設定
# ~/.zshrc に以下の設定を追加。
# 下記if文で指定した WORKON_HOME に仮想環境が構築される。
# 不要になったらここを削除しよう。
if [ -f /opt/homebrew/bin/virtualenvwrapper.sh ]; then
export WORKON_HOME=$HOME/.virtualenvs
source /opt/homebrew/bin/virtualenvwrapper.sh
fi
#eval "$(plenv init -)"
#
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - )"

# search history < peco >
function peco-select-history() {
	local tac
		if which tac > /dev/null; then
			tac="tac"
		else
			tac="tail -r"
				fi
				BUFFER=$(\history -n 1 | eval $tac | peco)
				CURSOR=$#BUFFER
				zle clear-screen
}
zle -N peco-select-history

bindkey '^r' peco-select-history

# vcs_infoロード
autoload -Uz vcs_info
# PROMPT変数内で変数参照する
setopt prompt_subst

# vcsの表示
zstyle ':vcs_info:*' formats '%s][* %F{green}%b%f'
zstyle ':vcs_info:*' actionformats '%s][* %F{green}%b%f(%F{red}%a%f)'
# プロンプト表示直前にvcs_info呼び出
precmd() { vcs_info }

PS1='[${vcs_info_msg_0_}]:%~/%f=>'
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH=$HOME/local/go/bin:$HOME/go/bin:$PATH
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
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

alias docker rmc='docker rm $(docker ps -a -q)'
alias docker rmi='docker rmi -f $(docker images -q -a -f dangling=true)'
alias ll='ls -al'
alias pb='pbcopy'
#git alias 
#alias ga='git add'
#alias gc='git commit -m'
#alias gp='git push'

plugins=(git)

export EDITOR='vim'

# direnv {{{
eval "$(direnv hook zsh)"
# }}}
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

export PATH="$HOME/.plenv/bin:$PATH"
