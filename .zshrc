# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/ad/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

### XDG base-directories
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_STATE_HOME="${HOME}/.local/state"

export zsh_script_dir="${XDG_DATA_HOME}/zsh/scripts" # "plugin" script location

# [...] whatever else you have

### Completions
[[ "${fpath[*]}" == *"${zsh_script_dir}/zsh-completions/src"* ]] || {
    fpath+=("${zsh_script_dir}/zsh-completions/src") # Zsh Completions does not get sourced, its /src directory containing the completions gets appended to $fpath
}
autoload -Uz compinit # load compinit

# **    :completion:function:completer:command:argument:tag <- Template
zstyle ':completion:*' menu select=1 # show a selection menu if there's more than 1 possible completion
zstyle ':completion:*' use-cache true # use a cache for completions
zstyle ':completion:*' cache-path "${XDG_STATE_HOME}/zsh_completions" # put the cache there
zstyle ':completion:*' special-dirs true # complete `.` and `..`
zstyle ':completion:*' list-colors "$LS_COLORS" # color completion candidates using the same scheme as $LS_COLORS
zstyle ':completion:*' rehash true # update completions for newly installed packages
zstyle ':completion:*:options' description 'yes' # provide descriptions for options

zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters # complete variable subscripts
zstyle ':completion:*:manuals' separate-sections true # display man completion by section number
# (WIP) make _fc completions not spew out every history event as an option

[[ -e "$XDG_CACHE_HOME/zsh" ]] || mkdir "$XDG_CACHE_HOME/zsh"
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump-${ZSH_VERSION}"

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"
source "$zsh_script_dir/zsh-autosuggestions/zsh-autosuggestions.zsh" 2> /dev/null
(( ${#FAST_HIGHLIGHT} )) || source "$zsh_script_dir/F-Sy-H/F-Sy-H.plugin.zsh"


source <(/usr/bin/starship init zsh --print-full-init)

alias systemupgrade="sudo mkinitcpio -P"
alias grubupdate="sudo grub-mkconfig -o /boot/grub/grub.cfg"

# Created by `pipx` on 2025-03-06 03:48:14
export PATH="$PATH:/home/ad/.local/bin"
