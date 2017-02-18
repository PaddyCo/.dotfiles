function collapse_pwd {
  echo $(pwd | sed -e "s,^$HOME,~,")
}

function prompt_char {
  git branch >/dev/null 2>/dev/null && echo '' && return
    hg root >/dev/null 2>/dev/null && echo '' && return
    echo ''
}

HOSTNAME="$(hostname)"

PROMPT='%{$fg_bold[green]%}%p%{$fg_bold[red]%}$USERNAME%{$reset_color%}%{$fg[white]%} at %{$fg_bold[yellow]%}$HOSTNAME %{$reset_color%}%{$fg[white]%}in %{$fg_bold[white]%}$(collapse_pwd) %{$fg_bold[blue]%}$(git_prompt_info)
%{$fg_bold[red]%} %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
