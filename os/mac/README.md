# Mac Setup

## VS Code

```bash
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
```

## Git

Git Config:

- Mac/Linux: `~/.gitconfig`

```bash
git config --global pull.rebase
git config --list --show-origin
```