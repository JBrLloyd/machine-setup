# Mac Setup

## VS Code

```bash
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
```

## Git

```bash
git config --global core.editor 'code --wait'
git config --global diff.tool vscode
git config --global difftool.vscode.cmd 'code --wait --diff $LOCAL $REMOTE'
git config --global merge.tool vscode
git config --global mergetool.vscode.cmd 'code --wait $MERGED'
git config --global branch.autosetuprebase always 
git config --global pull.rebase

# Aliases
git config --global help.autocorrect 20
git config --global alias.gl 'config --global -l'
git config --global alias.d 'diff'
git config --global alias.dv 'difftool -t vscode -y'
git config --global alias.rv 'remote -v'
git config --global alias.re 'rebase'
git config --global alias.rec 'rebase --continue'
git config --global alias.rea 'rebase --abort'
git config --global alias.cm 'commit -m'
git config --global alias.cp 'cherry-pick'
git config --global alias.cpc 'cherry-pick --continue'
git config --global alias.cpa 'cherry-pick -- abort'
git config --global alias.co 'checkout'
git config --global alias.com '!git checkout $(git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@') && git pull'
git config --global alias.cob 'checkout -b'
git config --global alias.br 'branch --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(contents:subject) %(color:green)(%(committerdate:relative)) [%(authorname)]' --sort=-committerdate'
git config --global alias.del 'branch -d'
git config --global alias.u 'reset --hard'
git config --global alias.undo 'reset HEAD~1 --mixed'
git config --global alias.last 'log -1 HEAD --stat'
git config --global alias.ll 'log --oneline'
git config --global alias.lg '!git log --pretty=format:\"%C(magenta)%h%Creset -%C(red)%d%Creset %s %C(dim green)(%cr) [%an]\" --abbrev-commit -30'
git config --global alias.s 'status -sb'
git config --global alias.st 'stash'
git config --global alias.sta 'stash apply'
git config --global alias.p 'push'
git config --global alias.pu '!git push -u origin HEAD'
git config --global alias.u 'pull'
git config --global alias.um 'git fetch origin $(git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@'):$(git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@')'
git config --global alias.ua '!git fetch && $(git symbolic-ref --short refs/remotes/origin/HEAD)'
git config --global alias.se '!git rev-list --all | xargs git grep -F'
```
