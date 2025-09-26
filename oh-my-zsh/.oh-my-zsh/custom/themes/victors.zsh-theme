#!/usr/bin/env zsh

# Define the color for the hostname
local HOST_COLOR=$fg_bold[yellow]

# Get the short hostname by dynamically finding the prefix.
local short_host="${HOST//[^[:alpha:]]*/}"

# If User is root (UID 0), use red for the username. Else, nice green.
if [[ $UID -eq 0 ]]; then
    # Red username, blue hostname
    local user_host='%{$terminfo[bold]$fg[red]%}%n@%{$reset_color%}%{$HOST_COLOR%}'"${short_host}"' %{$reset_color%}'
    PROMPT_PROMPT=$FG[red]
else
    # Green username, blue hostname
    local user_host='%{$terminfo[bold]$FG[077]%}%n@%{$reset_color%}%{$HOST_COLOR%}'"${short_host}"' %{$reset_color%}'
    PROMPT_PROMPT=$FG[077]
fi

setopt promptsubst

autoload -U add-zsh-hook

CUR_DIR_COLOR=$fg_bold[blue]
PROMPT_PROMPT=$FG[077]
VENV_COLOR=$fg_bold[yellow]

GIT_DIRTY_COLOR=$FG[133]
GIT_CLEAN_COLOR=$FG[118]
GIT_PROMPT_INFO=$FG[012]

local current_dir='%{$CUR_DIR_COLOR%}%~ %{$reset_color%}'
local git_branch='%{$GIT_PROMPT_INFO%}$(git_prompt_info)%{$reset_color%}'
local venv_prompt='%{$VENV_COLOR%}$(virtualenv_prompt_info)%{$reset_color%}'
#local prompt_prompt='%{$PROMPT_PROMPT%}ᐅ %{$reset_color%}'
local prompt_prompt='%{$PROMPT_PROMPT%}$ %{$reset_color%}'

# The ${user_host} variable contains username@hostname in separate colors
PROMPT="${user_host}${current_dir}${git_branch}${venv_prompt}${prompt_prompt}"

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$GIT_PROMPT_INFO%}) "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$GIT_DIRTY_COLOR%}✘"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$GIT_CLEAN_COLOR%}✔"

ZSH_THEME_VIRTUALENV_PREFIX="["
ZSH_THEME_VIRTUALENV_SUFFIX="] "
