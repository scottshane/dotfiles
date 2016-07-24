# ZSH Theme emulating the Fish shell's default prompt.

_fishy_collapsed_wd() {
  echo $(pwd | perl -pe "s|^$HOME|~|g; s|/([^/])[^/]*(?=/)|/\$1|g")
}

eval mgreen='$FG[034]'
eval mhotpink='$FG[201]'
eval mblue='$FG[033]'
eval mgray80='$FG[244]'
eval mgray44='$FG[238]'
eval myellow228='$FG[228]'

local user_color='cyan'; [ $UID -eq 0 ] && user_color='red'

PROMPT='%{$FG[137]%}%n: %{$FG[039]%}$(_fishy_collapsed_wd)%{$reset_color%}%(!.#. )
→ '
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'
local return_status="%{$fg_bold[red]%}%(?..%?)%{$reset_color%}"
RPROMPT='${return_status} $(git_prompt_info)%{$reset_color%}$(minutes_since_last_commit) %{$FG[097]%}$(git_prompt_short_sha)%{$reset_color%} $(git_remote_status)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$FG[239]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$FG[239]%}"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=" $FG[034]√%{$FG[239]%}"

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg_bold[green]%}+%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="$mhotpink*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg_bold[red]%}-%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg_bold[magenta]%}>%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg_bold[yellow]%}#%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="$mblue?%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="↓"
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="↑"
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="↕"