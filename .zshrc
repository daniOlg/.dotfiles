export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

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
