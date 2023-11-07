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
ZSH_THEME="p10k-my-theme_V2"

#------------------------------
# Подключение конфигурации, если она есть
#------------------------------
if [[ -f ${HOME}/.$ZSH_THEME.zsh ]]; then 
    source ${HOME}/.$ZSH_THEME.zsh
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
