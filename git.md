# Git

## Hard to remember commands

- `git branch -d [branch_name]`
  - "safe" delete a local branch.
- `git checkout -b [branch_name]`
  - Create new branch.
- `git push [origin] --delete [branch_name]`
  - Delete the remote version of a branch. \(Though I often feel safer doing it via the repo GUI.\)
- `git remote update [origin] --prune`
  - Prune stale branches from your remote cache\`\`\`
- `git clean -fd`
  - Removes untracked files and directories from the working tree. I.e., it deletes the red stuff.
  - `-f` is to force the clean. I think that, since it's destructive, they make you type it.
  - `-d` is to recursively clean directories. Effectively, that means it deletes directories as well.
- `git rm --cached -r .`
  - `--cached` will `rm` only cached files, i.e., remove paths only from the index \(i.e., cache\) without messing with the working tree \(i.e., your in progress work, aka the red stuff\).
  - `-r` will `rm` recursively. E.g., `... -r .` will `rm` the current directory and files and all sub-directories and files.

## Syntax

- `HEAD` is the commit upon which you are basing your current changes in the working tree. \([docs](https://git-scm.com/docs/git-rev-parse#Documentation/git-rev-parse.txt-emltrefnamegtemegemmasterememheadsmasterememrefsheadsmasterem)\)
- `@` is an alias for HEAD
- `<rev>` is a generic term that specifies a "revision". This is typically a commit SHA. Another type of revision is a refname, which poitns to a SHA. \([docs](https://git-scm.com/docs/git-rev-parse#_specifying_revisions)\)
- `<ref>`, or `<refname>`, is a reference to a revision \(or, `<rev>`\). These are the most commonly used revisions, e.g., `master`, `branch-name`, `HEAD`, etc. \([docs](https://git-scm.com/docs/git-rev-parse#Documentation/git-rev-parse.txt-emltrefnamegtemegemmasterememheadsmasterememrefsheadsmasterem)\)
- `<ref>~<n>`, e.g., `HEAD~3`, is [syntactic sugar](https://git-scm.com/docs/git-rev-parse#Documentation/git-rev-parse.txt-emltrevgtltngtemegemHEADmaster3em) which refers to the 3rd \(or nth\) ancestor commit to HEAD. So, like, 3 commits back, not including the `HEAD` commit.
