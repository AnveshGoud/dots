
export EDITOR='vim'
export FZF_BASE='/usr/local/opt/fzf/'
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH


# Path to your oh-my-zsh installation.
export ZSH="/home/anarch/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="spaceship"

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
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

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
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(git)
plugins=(
          # command-time
          django
          docker
          docker-compose
          fzf
          git
          python
          tmuxinator
          ssh-agent
	  zsh-completions
	  # zsh-autocomplete
)



zstyle :omz:plugins:ssh-agent agent-forwarding on

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
SPACESHIP_PROMPT_ORDER=(
#  venv          # virtualenv section
#  conda         # conda virtualenv section
  pyenv         # Pyenv section
#  time          # Time stampts section
#  user          # Username section
#  host          # Hostname section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
#  hg            # Mercurial section (hg_branch  + hg_status)
  #package       # Package version
  #node          # Node.js section
#  ruby          # Ruby section
#  elixir        # Elixir section
#  xcode         # Xcode section
  #swift         # Swift section
#  golang        # Go section
  #php           # PHP section
  #rust          # Rust section
  #haskell       # Haskell Stack section
  #julia         # Julia section
#  docker        # Docker section
#  aws           # Amazon Web Services section
#  dotnet        # .NET section
#  ember         # Ember.js section
  #kubecontext   # Kubectl context section
  exec_time     # Execution time
  line_sep      # Line break
#  battery       # Battery level and status
#  vi_mode       # Vi-mode indicator
  jobs          # Backgound jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#source ~/.bin/tmuxinator.zsh

[ -f ~/.forgit/forgit.plugin.zsh ] && source ~/.forgit/forgit.plugin.zsh

# Aliases
alias home='cd ${HOME}'
alias up='cd ..'
alias up2='cd ../.'
alias up3='cd ../../..'
alias up4='cd ../../../..'
alias up5='cd ../../../../..'
alias pe='printenv'
alias senv='env | sort'
alias pu='pushd'
alias po='popd'
alias pud='pushd .'
alias rot='pushd +1'
alias jobs='jobs -l'
alias his=history
alias hm='history | less'
alias sy3='sync; sync; sync; echo "sync 3 times ..."'
alias del='rm -i'
alias bye=exit
alias ciao=exit

####################################################################################
# Git aliases
#####################################################################################
function g-up
{
    git up
}

function g-co
{
    git co $@
}

function g-cob
{
    git cob $@
}


function g-br
{
    git br
}

function g-st
{
    git st
}

function g-pub
{
    git publish
}

function g-au
{
    git au
}

function g-cm
{
    git cm $@
}

function g-dif
{
    git diff
}

##################################################################
# System aliases
####################################################################

#########################################################################################################
# GIT heart FZF
# ######################################################################################################

# Will return non-zero status if the current directory is not managed by git
is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

gt() {
  # "Nothing to see here, move along"
  is_in_git_repo || return

  # Pass the list of the tags to fzf-tmux
  # - "{}" in preview option is the placeholder for the highlighted entry
  # - Preview window can display ANSI colors, so we enable --color=always
  # - We can terminate `git show` once we have $LINES lines
  git tag --sort -version:refname |
    fzf-tmux --multi --preview-window right:70% \
             --preview 'git show --color=always {} | head -'$LINES
}

brg() {
  is_in_git_repo || return
  git branch -a --color=always | grep -v '/HEAD\s' | sort |
  fzf-tmux --ansi --multi --tac --preview-window right:70% \
    --preview 'git log --oneline --graph --date=short --pretty="format:%C(auto)%cd %h%d %s" $(sed s/^..// <<< {} | cut -d" " -f1) | head -'$LINES |
  sed 's/^..//' | cut -d' ' -f1 |
  sed 's#^remotes/##'
}

start_pycharm() {
  tmux has -t pycharm
  if [ '$?'='0' ]; then
      tmux kill-session -t pycharm
  fi
  tmuxinator start pycharm
}
 


# A helper function to join multi-line output from fzf
join-lines() {
  local item
  while read item; do
    echo -n "${(q)item} "
  done
}

fzf-gt-widget() LBUFFER+=$(gt | join-lines)
zle -N fzf-gt-widget
bindkey '^g^t' fzf-gt-widget


fzf-gb-widget() LBUFFER+=$(brg | join-lines)
zle -N fzf-gb-widget
bindkey '^g^b' fzf-gb-widget
###################################################################################
# Ke Bindings
# ################################################################################i
bindkey -s '\Co\Cf' 'vim $(fzf)\n' # Open file
bindkey -s '\Cg\Cu' 'g-up\n' # start pycharm in tmux
bindkey -s '\Cd\Cb' 'dbdb\n' # start database dbss
bindkey -s '\Ct' 'tmux\n' # start pycharm in tmux
 

# Load pyenv automatically by adding
# the following to ~/.zshrc:

#export PATH="/home/office.zone/adindu/.pyenv/bin:$PATH"
#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"


export PYENV_VIRTUALENV_DISABLE_PROMPT=1

zstyle ':completion:*' menu select
export TERM=xterm-256color
#eval 'setxkbmap -option caps:ctrl_modifier'
eval `pgrep xcape| xargs kill -9 2>/dev/null`
#source ~/.config/i3/make_tab_super.sh

export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
  fi

# Shorten or lengthen the autocompletion list
# zstyle ':autocomplete:list-choices:*' max-lines 50
# To use ⇥ and ⇤ to start menu selection:
# zstyle ':autocomplete:tab:*' completion select
# To have ⇥ and ⇤ cycle between matches (without starting menu selection):
# zstyle ':autocomplete:tab:*' completion cycle
# To have ⇥ use fzf's completion feature:
# zstyle ':autocomplete:tab:*' completion fzf
# Disable fzf key bindings
# zstyle ':autocomplete:*' fuzzy-search off

#Please set:

#	export DISABLE_AUTO_TITLE='true'

#in ~/.zshrc or where your zsh profile is stored.
#Remember the "export" at the beginning!

#Then create a new shell or type:
