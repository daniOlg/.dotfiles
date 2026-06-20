export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

setopt COMBINING_CHARS

# Configurar terminal personalizada

# 1. Habilitar funciones necesarias
setopt PROMPT_SUBST

# 2. Definición de colores Gruvbox (Limpios)
C_ORANGE='%F{#d65d0e}'
C_YELLOW='%F{#d79921}'
C_BG1='%F{#3c3836}'
C_FG0='%F{#fbf1c7}'
C_GREEN='%F{#98971a}'
RESET='%f%k'

# 3. Construcción del Prompt con Escapes de Ancho Cero %{ ... %}
# Envolvemos CADA ICONO individualmente para que ZSH no intente medirlo
SEG_1="%{$C_ORANGE%}%{%}%{%K{#d65d0e}%}%{$C_FG0%} %n %{%k%}"
SEG_2="%{%K{#d79921}%}%{$C_ORANGE%}%{%}%{$C_FG0%} %~ %{%k%}"
SEG_3="%{%K{#3c3836}%}%{$C_YELLOW%}%{%}%{$C_FG0%} %{%} %t %{%k%}"
SEG_4="%{$C_BG1%}%{%}$RESET"

# 4. El Prompt Final
# IMPORTANTE: El carácter final '>' o '#' es estándar para evitar bugs de ancho
PROMPT="${SEG_1}${SEG_2}${SEG_3}${SEG_4}"$'\n'"%{$C_GREEN%}> $RESET"

# 5. Forzar el refresco de la terminal (Añade esto al final)
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

. "$HOME/.local/bin/env"


# bun
## completions
[ -s "/home/dani/.bun/_bun" ] && source "/home/dani/.bun/_bun"
## env
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

#eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv zsh)"

# uv
source $HOME/.local/bin/env

# fnm
eval "$(fnm env --use-on-cd --shell zsh)"

# pnpm
export PNPM_HOME="/home/dani/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# custom things ~/.functions, ~/.exports, ~/.aliases
for file in ~/.{exports,aliases,functions}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
done
