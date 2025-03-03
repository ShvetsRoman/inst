# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -v

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

# Disable automatic widget re-binding on each precmd. This can be set when
# zsh-users/zsh-autosuggestions is the last module in your ~/.zimrc.
ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# ------------------
# Initialize modules
# ------------------

ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  if (( ${+commands[curl]} )); then
    curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  else
    mkdir -p ${ZIM_HOME} && wget -nv -O ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  fi
fi
# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
# Initialize modules.
source ${ZIM_HOME}/init.zsh

# zsh-history-substring-search
zmodload -F zsh/terminfo +p:terminfo
# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
for key ('^[[A' '^P' ${terminfo[kcuu1]}) bindkey ${key} history-substring-search-up
for key ('^[[B' '^N' ${terminfo[kcud1]}) bindkey ${key} history-substring-search-down
for key ('k') bindkey -M vicmd ${key} history-substring-search-up
for key ('j') bindkey -M vicmd ${key} history-substring-search-down
unset key
# }}} End configuration added by Zim install


#-----------------------------
# Alias
#-----------------------------
if [[ -f ${HOME}/.config/zsh/zsh_alias ]]; then
    source ${HOME}/.config/zsh/zsh_alias
elif [[ -f ${HOME}/.zsh_alias ]]; then
    source ${HOME}/.zsh_alias
fi
 
#-----------------------------
# PATH
#-----------------------------
if [[ -f ${HOME}/.config/zsh/zsh_path ]]; then
    source ${HOME}/.config/zsh/zsh_path
elif [[ -f ${HOME}/.zsh_path ]]; then
    source ${HOME}/.zsh_path
fi

#-----------------------------
# ICONS 
#-----------------------------
if [[ -f ${HOME}/.config/nvim/icons ]]; then
    source ${HOME}/.config/nvim/icons
fi

#-----------------------------
# COLORS 
#-----------------------------
if [[ -f ${HOME}/.config/nvim/colors ]]; then
    source ${HOME}/.config/nvim/colors
fi

#-----------------------------
# FZF
#-----------------------------
if [[ ${+commands[fzf]} ]]; then
    source <(fzf --zsh)
fi

#------------------------------
# History stuff
#------------------------------
if [[ -f ${HOME}/.config/zsh/.zshrc ]]; then
    HISTFILE=${HOME}/.config/zsh/zsh_history
else
    HISTFILE=${HOME}/.zsh_history
fi

HISTSIZE=1000
SAVEHIST=1000
HISTORY_IGNORE="(ls|lsa|ll|lla|pwd|exit|x|clear|c)"
HIST_STAMPS="yyyy-mm-dd"
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.
setopt APPEND_HISTORY            # append to history file (Default)
setopt HIST_NO_STORE             # Don't store history commands
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks from each command line being added to the history list.
