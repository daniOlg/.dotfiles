# dotfiles

My personal dotfiles managed with a [bare git repository](https://www.atlassian.com/git/tutorials/dotfiles).

## What's included

| File | Description |
|------|-------------|
| `.zshrc` | Zsh config — oh-my-zsh, custom prompt, bun, fnm, pnpm |
| `.aliases` | Shell aliases (nvim, git, pnpm, docker, screen) |
| `.functions` | Shell functions: `commit` (AI-generated messages) and `pr` (Azure DevOps PR creator) |
| `.gitconfig` | Global git configuration |
| `.gitignore` | Global gitignore |
| `.config/starship.toml` | Starship prompt config (gruvbox dark theme) |
| `.config/nvim/` | Neovim config — LazyVim-based setup |

## Bootstrap on a new machine

**1. Clone the bare repo**

```sh
git clone --bare https://github.com/daniOlg/.dotfiles.git $HOME/.dotfiles
```

**2. Add the alias to your current shell**

```sh
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

**3. Avoid showing untracked files**

```sh
dotfiles config --local status.showUntrackedFiles no
```

**4. Checkout the files**

```sh
dotfiles checkout
```

If there are conflicts with existing files, back them up first:

```sh
mkdir -p ~/.dotfiles-backup
dotfiles checkout 2>&1 | grep "^\s" | awk '{print $1}' | xargs -I{} mv {} ~/.dotfiles-backup/{}
dotfiles checkout
```

**5. Install dependencies**

- [oh-my-zsh](https://ohmyz.sh/)
- [Neovim](https://neovim.io/) (v0.10+)
- [fnm](https://github.com/Schniz/fnm) — Node version manager
- [bun](https://bun.sh/)
- [pnpm](https://pnpm.io/)
- [Homebrew (Linuxbrew)](https://brew.sh/)
- [Starship](https://starship.rs/) — optional, prompt is currently commented out

## Day-to-day usage

```sh
# Check status
dotfiles status

# Stage and commit a change
dotfiles add ~/.zshrc
dotfiles commit -m "feat: update zshrc"

# Push
dotfiles push
```

## Notable shell functions

### `commit [message]`

Stages all changes and commits. If no message is given, generates one with Claude (haiku) from the diff.

```sh
commit              # AI-generated message
commit "fix: typo"  # manual message
```

### `pr [target] [title] [--id JIRA-ID]`

Pushes current branch and creates an Azure DevOps PR. Requires `~/.azure-devops-pat`.

```sh
pr                          # PR → develop
pr qa                       # PR → qa
pr develop "feat: new thing"
pr develop --id IDI-1234    # includes Jira link in description
```
