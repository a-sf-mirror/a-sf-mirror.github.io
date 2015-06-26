---
layout: simple
title: ASFMirror
---

# The problem with SourceForge

SourceForge is dying. As it's not anymore the most popular platform of choice for hosting open source projects, SourceForge started reacting very badly by adding shady ads to its site, and even mangles the downloads of the hosted projects by adding unsollicited adware, without a warning. See [Ars Technica](http://arstechnica.com/information-technology/2015/05/sourceforge-grabs-gimp-for-windows-account-wraps-installer-in-bundle-pushing-adware/) for a detailed description.

A number of projects have moved away from sourceforge after this. However, a lot of good projects may have lost their maintainer, and these projects may risk being lost if SourceForge dies or purges projects it judges "non-profitable".
On the other hand, GitHub is a saner and healthier alternative for hosting these projects.

*ASFMirror* is a collection of mirrors of such projects. Currently, the mirrored projects are:

* [kiki](kiki): kiki the nanobot is a 3-D puzzle game. It is basically a mixture of the games Sokoban and Kula-World. [[repo]](https://github.com/a-sf-mirror/kiki)
* [gusanos](gusanos): Project Gusanos is a 2D worms like game. [[repo]](https://github.com/a-sf-mirror/gusanos)

This list is open to expansion: if you feel a project lacks a maintainership that could push the project elsewhere if sourceforge dies, you can drop a line to `<sfmirror AT indigo DOT re>` so we clone it or also [clone the project yourself](#how-to-clone-a-project-yourself).

If your project was added and you don't want that, you can also drop us a line.

# What is mirrored?

Currently, for each cloned project, we mirror the CVS repository and the website.

## CVS

The CVS repository of the project's code is converted to a git repository. There may be issues with CVS branches while mirroring.

## Website

The website of the project, if hosted on sourceforge (url in the form `http://<project name>.sf.net/`) is mirrored, while trying to do the smallest notifications possible for it to work. The modifications are automated, and may contain errors. The website mirror is done to a branch (named "gh-pages") of the git repo.

# How to clone a project yourself?

[This is the script we use to convert CVS to git.](sf-cvs-to-git.zsh) It relies on "git-cvsimport".

[This is the script we use to import the project site to gh-pages branch.](sf-site-to-gh.zsh)

