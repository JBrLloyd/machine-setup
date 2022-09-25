# Mac Setup

## Git

```bash
git config --global core.editor 'code --wait'
git config --global diff.tool vscode
git config --global difftool.vscode.cmd 'code --wait --diff $LOCAL $REMOTE'
git config --global merge.tool vscode
git config --global mergetool.vscode.cmd 'code --wait $MERGED'

# Aliases
git config --global help.autocorrect 20
git config --global alias.gl 'config --global -l'
git config --global alias.d 'diff'
git config --global alias.dv 'difftool -t vscode -y'
git config --global alias.rv 'remote -v'
git config --global alias.re 'rebase'
git config --global alias.rec 'rebase --continue'
git config --global alias.cm 'commit -m'
git config --global alias.last 'log -1 HEAD --stat'
git config --global alias.ll 'log --oneline'
git config --global alias.st 'status -sb'
git config --global alias.p 'push'
git config --global alias.pu '!git push -u origin HEAD'
git config --global alias.se '!git rev-list --all | xargs git grep -F'
```
