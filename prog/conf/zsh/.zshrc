# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#------------------------------
# Theme powerlevel10k (для настройки набрать терминале p10k configure)
#------------------------------
if [[ -f /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme ]]; then
    source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
fi

#------------------------------
# Название темы
#------------------------------
# ZSH_THEME="p10k"
# ZSH_THEME="p10k_1"
ZSH_THEME="p10k_2"
# ZSH_THEME="p10k_3"
# ZSH_THEME="p10k_4"
#------------------------------
# Подключение конфигурации, если она есть
#------------------------------
if [[ -f ${HOME}/.${ZSH_THEME}.zsh ]]; then 
    source ${HOME}/.${ZSH_THEME}.zsh
elif [[ -f ${HOME}/.p10k.zsh ]]; then
    source ${HOME}/.p10k.zsh
fi

#-----------------------------
# Плагин подсветки текста
#-----------------------------
if [[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

#-----------------------------
# Плагин автодополнения с истории
#-----------------------------
if [[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

#-----------------------------
# Плагин поиск в истории
#-----------------------------
if [[ -f /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh ]]; then
    source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
fi

# #-----------------------------
# # Плагин avto activate venv
# #-----------------------------
# if [[ -f /usr/share/zsh/plugins/zsh-autoswitch-virtualenv/autoswitch_virtualenv.plugin.zsh ]]; then
#     source /usr/share/zsh/plugins/zsh-autoswitch-virtualenv/autoswitch_virtualenv.plugin.zsh
# fi

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
# LF ICONS 
#-----------------------------
if [[ -f ${HOME}/.config/lf/icons ]]; then
    source ${HOME}/.config/lf/icons
fi

#-----------------------------
# LF COLORS 
#-----------------------------
if [[ -f ${HOME}/.config/lf/colors ]]; then
    source ${HOME}/.config/lf/colors
fi

#------------------------------
# History stuff
#------------------------------
HISTFILE=${HOME}/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
HISTORY_IGNORE="(ls|lsa|ll|lla|pwd|exit|x|clear|c|cd)"
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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
