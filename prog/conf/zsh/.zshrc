#-----------------------------
# Starship
#-----------------------------
eval "$(starship init zsh)"

#-----------------------------
# Television Zsh
#-----------------------------
# eval "$(tv init zsh)"

#-----------------------------
# Alias
#-----------------------------
if [[ -f ${HOME}/.zsh_alias ]]; then
   source ${HOME}/.zsh_alias
fi
 
#-----------------------------
# PATH
#-----------------------------
if [[ -f ${HOME}/.zsh_path ]]; then
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

#------------------------------
# History stuff
#------------------------------
HISTFILE=${HOME}/.zsh_history
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

#------------------------------
# Додає підсвічування синтаксису в Zsh
#------------------------------
if [[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

#------------------------------
# Це потужний плагін автодоповнення для Zsh, який поєднує в собі як автодоповнення команд, так і підказки в стилі fish shell
#------------------------------
if [[ -f /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh ]]; then
    source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
fi

#------------------------------
# Підказує команди з історії в реальному часі, прямо коли ти вводиш
#------------------------------
if [[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

#------------------------------
# Набір автодоповнень для Zsh
#------------------------------
# autoload -Uz compinit
# compinit

