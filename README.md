# Mac Setup

## VS Code

```bash
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
```

## Git

```bash
git config --global pull.rebase
git config --list --show-origin

# Aliases
[user]
	name = Jackson Lloyd
	email = jackson.lloyd@pointsbet.com
[credential]
	helper = 
[core]
	autocrlf = input
	editor = code --wait
[diff]
	tool = vscode
[difftool "vscode"]
	cmd = code --wait --diff $LOCAL $REMOTE
[merge]
	tool = vscode
[mergetool "vscode"]
	cmd = code --wait $MERGED
[help]
	autocorrect = 20
[alias]
	br = branch --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(contents:subject) %(color:green)(%(committerdate:relative)) [%(authorname)]' --sort=-committerdate
	bclean !f() { git branch --merged ${1-master} | grep -v " ${1-master}$" | xargs -r git branch -d; }; f
	cmaa = commit -a --amend -C HEAD
	cm = commit -m
	co = checkout
	cob = checkout -b
	com = !git checkout $(git symbolic-ref refs/remotes/origin/HEAD | sed s@^refs/remotes/origin/@@) && git pull
	cp = cherry-pick
	cpc = cherry-pick --continue
	cpa = cherry-pick -- abort
	del = branch -d
	d = diff
	dv = difftool -t vscode -y
	gl = config --global -l
	last = log -1 HEAD --stat
	ll = log --oneline
	lg = !git log --pretty=format:\\\"%C(magenta)%h%Creset -%C(red)%d%Creset %s %C(dim green)(%cr) [%an]\\\" --abbrev-commit -30
	mm = !git fetch $(git symbolic-ref refs/remotes/origin/HEAD | sed s@^refs/remotes/origin/@@) && git merge $(git symbolic-ref refs/remotes/origin/HEAD | sed s@^refs/remotes/origin/@@)
	p = push
	pu = !git push -u origin HEAD
  	r = reset
  	r1 = reset HEAD^
	r2 = reset HEAD^^
	rh = reset --hard
	rh1 = reset HEAD^ --hard
	rh2 = reset HEAD^^ --hard
	re = rebase
	rec = rebase --continue
	rea = rebase --abort
	rv = remote -v
	s = status -sb
	se = !git rev-list --all | xargs git grep -F
	shl = stash list
	sha = stash apply
	shs = stash save
	um = git fetch origin $(git symbolic-ref refs/remotes/origin/HEAD | sed s@^refs/remotes/origin/@@):$(git symbolic-ref refs/remotes/origin/HEAD | sed s@^refs/remotes/origin/@@)
[branch]
	autosetuprebase = always
```
