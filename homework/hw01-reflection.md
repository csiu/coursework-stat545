## Github workflow

Althought RStudio is great, I like using the terminal 
when adding/committing/pulling/pushing changes to Github.

- there is less mouse clicking
- a lot more control, and
- it's simple (provided you know what you're doing).

My work flow goes something like this:
```
cd <PROJ_DIR>
git init

git remote add origin <SOME-GITHUB-ADDRESS>

emacs README.md

git add README.md
git commit -m 'ADD README'

git push origin master
```

Here we initialized a git repo, 
added a remote, 
edited a `README.md`,
added changes to git,
committed changes to git, 
and pushed the changes to a remote,
all without using the mouse.

## Markdown
I worked with Markdown before. 
I also used R Markdown and [Sweave](https://en.wikipedia.org/wiki/Sweave).
