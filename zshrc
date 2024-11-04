# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_histfile
HISTSIZE=15000
SAVEHIST=15000
setopt nomatch interactivecomments
unsetopt autocd beep extendedglob notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/vincent/.zshrc'

# Enable ls menu and colors
eval "$(dircolors)"
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
zstyle ':completion:*' menu yes select

autoload -Uz compinit
compinit
# End of lines added by compinstall

# zoxide
eval "$(zoxide init zsh --cmd cd)"

# fzf
eval "$(fzf --zsh)"

# powerlevel10k-theme
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# aliases
[[ -f ~/.shell_aliases ]] && source ~/.shell_aliases

# functions
[[ -f ~/.shell_functions ]] && source ~/.shell_functions

bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward
# jump word
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

bindkey "^[[3~" delete-char
