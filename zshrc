# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="modified-agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
#ZSH_CUSTOM=~/.dotfiles/oh-my-zsh/custom

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  alias-finder
  autopep8
  catimg
  colored-man-pages
  compleat
  copyfile
  debian
  dircycle
  docker
  dotenv
  extract
  fasd
  gpg-agent
  git
  git-extras
  history-substring-search
  npm
  pip
  vi-mode
  web-search
  zsh-syntax-highlighting
  fzf
)

# due to "widgets can only be called when zle is active" error 
# https://stackoverflow.com/questions/20357441/zsh-on-10-9-widgets-can-only-be-called-when-zle-is-active
TRAPWINCH() {
    zle && { zle reset-prompt; zle -R }
}
#
# due to zsh-syntax-highlighting plugin error 
ZSH_DISABLE_COMPFIX=true

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
else
   export EDITOR='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# turn off all beeps
#unsetopt BEEP

# turn off autocompletion beeps
# unsetopt LIST_BEEP

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
## set colors for LS_COLORS
eval `dircolors ~/.dircolors`

prompt_context(){}

# make a directory, and move into it
# https://unix.stackexchange.com/questions/125385/combined-mkdir-and-cd
mkcdir ()
{
    mkdir -p -- "$1" &&
    cd -P -- "$1"
}

# move to the directory of a symbolic link
# https://superuser.com/questions/231989/move-to-the-directory-of-a-symbolic-link
function cdl
{
    cd $(dirname $(readlink -f "$1"))
}

# add some aliases
alias sl="ls"
alias mv="mv -i" # prompt before overwriting
alias mkdir="mkdir -p" # make parent dirs if needed
alias df="df -h" # print human readable format
alias gs="git status"
alias dc="cd" # spelling mistakes
alias toggle-colours="alacritty-colorscheme -C ~/.eendroroy-alacritty-theme/themes -T && update-alacritty-config"
alias list-colours="alacritty-colorscheme -C ~/.eendroroy-alacritty-theme/themes -l" 
alias show-colours="alacritty-colorscheme -s"
alias set-colours="alacritty-colorscheme -C ~/.eendroroy-alacritty-theme/themes -a" 
# after updating colours etc it will be necessary to update alacritty config in windows until a better solution is found
alias update-alacritty-config="cp ~/.config/alacritty/alacritty.yml /mnt/c/Users/James/AppData/Roaming/alacritty/"
# disable rm for safety
alias rm='echo "rm is disabled, use srm or /bin/rm instead."'
# add safe remove srm 
alias srm='/bin/rm -irv'
# reminders to try other tools
#alias cat='echo "Try bat!" && cat'
alias du='echo "Try dust!" && cat'
alias fd=fdfind
alias ghci='ghci -fwarn-incomplete-patterns'
#alias v="vim"
alias v='nvim'
alias python='python3'
alias svim='vim -u ~/.SpaceVim/vimrc'

# run screenfetch on start
# cd ~
screenfetch -w

# Created by `userpath` on 2020-04-03 06:17:38
export PATH="$PATH:/home/sinkers/.local/bin:/usr/local/go/bin"
export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# for zsh tab completion on cht.sh
fpath=(~/.zsh.d/ $fpath)

[ -f "/home/sinkers/.ghcup/env" ] && source "/home/sinkers/.ghcup/env" # ghcup-env

# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"
