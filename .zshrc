

# binds:

# Arreglar las teclas Inicio (Home) y Fin (End)
bindkey "^[[H" beginning-of-line
bindkey "^[[1~" beginning-of-line
bindkey "^[OH" beginning-of-line

bindkey "^[[F" end-of-line
bindkey "^[[4~" end-of-line
bindkey "^[OF" end-of-line

# Arreglar también Suprimir (Delete) por si acaso
bindkey "^[[3~" delete-char

# plugins
plugins=(git zsh-autosuggestions)

# starship
eval "$(starship init zsh)"

# brew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv zsh)"

# dotfiles alias
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
