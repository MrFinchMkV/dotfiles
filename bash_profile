#
# ~/.bash_profile
#

export VISUAL=/usr/bin/vim
export EDITOR="$VISUAL"
export PATH="$PATH:/home/vincent/.dotnet/tools"

DOTNET_CLI_TELEMETRY_OPTOUT=1

[[ -f ~/.profile_tokens ]] && . ~/.profile_tokens
[[ -f ~/.bashrc ]] && . ~/.bashrc

