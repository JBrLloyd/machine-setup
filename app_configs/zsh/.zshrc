if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    exec startx
fi

# HISTFILE=~/.histfile
# HISTSIZE=1000
# SAVEHIST=1000
setopt autocd beep extendedglob nomatch notify
# bindkey -v

# export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"
export ARCHFLAGS="-arch x86_64"


# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='nvim'
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""
HYPHEN_INSENSITIVE="true"

zstyle ':omz:update' mode auto  # update automatically without asking
zstyle ':omz:update' frequency 30

source /usr/share/zsh/share/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle lein
antigen bundle command-not-found
antigen bundle cp
antigen bundle bundler
antigen bundle docker
antigen bundle dotenv
antigen bundle dotnet
# antigen bundle helm
antigen bundle history
antigen bundle minikube
antigen bundle npm
antigen bundle nvm
antigen bundle rust
antigen bundle yarn

antigen bundle fuck
antigen bundle fzf
antigen bundle autojump

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions

antigen apply

source $ZSH/oh-my-zsh.sh




# # S: Shift, Alt, Ctrl and Meta modifiers
# # key[Control-Left]="${terminfo[kLFT5]}"
# # key[Control-Right]="${terminfo[kRIT5]}"

# [[ -n "${key[Control-Left]}"  ]] && bindkey -- "${key[Control-Left]}"  backward-word
# [[ -n "${key[Control-Right]}" ]] && bindkey -- "${key[Control-Right]}" forward-word
# # EO: Shift, Alt, Ctrl and Meta modifiers

# # S: Dotnet CLI AutoComplete
# function _dotnet_bash_complete()
# {
#     local cur="${COMP_WORDS[COMP_CWORD]}" IFS=$'\n'
#     local candidates

#     read -d '' -ra candidates < <(dotnet complete --position "${COMP_POINT}" "${COMP_LINE}" 2>/dev/null)

#     read -d '' -ra COMPREPLY < <(compgen -W "${candidates[*]:-}" -- "$cur")
# }

# # complete -f -F _dotnet_bash_complete dotnet
# # EO: Dotnet CLI AutoComplete


# # S: Reset Terminal Escape Sequence
# # print '\e(0\e)B' --> will reset the terminal
# autoload -Uz add-zsh-hook

# function reset_broken_terminal () {
# 	printf '%b' '\e[0m\e(B\e)0\017\e[?5l\e7\e[0;0r\e8'
# }

# add-zsh-hook -Uz precmd reset_broken_terminal
# # EO: Reset Terminal Escape Sequence

# # S: File manager key binds
# # Alt+Left = go back 1 in directory history
# # Alt+Up = go to parent directory
# cdUndoKey() {
#     popd
#     zle       reset-prompt
#     print
#     ls
#     zle       reset-prompt
# }

# cdParentKey() {
#     pushd ..
#     zle      reset-prompt
#     print
#     ls
#     zle       reset-prompt
# }

# zle -N                 cdParentKey
# zle -N                 cdUndoKey
# bindkey '^[[1;3A'      cdParentKey
# bindkey '^[[1;3D'      cdUndoKey
# # EO: File manager key binds

# S: Crtl+d close shell
exit_zsh() { exit }
zle -N exit_zsh
bindkey '^D' exit_zsh
# EO: Crtl+d close shell

# S: Star Ship
eval "$(starship init zsh)"
# EO: Star Ship
