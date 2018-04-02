---
layout: default
title: ASFMirror
---

# The problem with SourceForge

SourceForge is dying. As it's not anymore the most popular platform of choice for hosting open source projects, SourceForge started reacting very badly by adding shady ads to its site, and even mangles the downloads of the hosted projects by adding unsollicited adware, without a warning. See [Ars Technica](http://arstechnica.com/information-technology/2015/05/sourceforge-grabs-gimp-for-windows-account-wraps-installer-in-bundle-pushing-adware/) for a detailed description.

A number of projects have moved away from sourceforge after this. However, a lot of good projects may have lost their maintainer, and these projects may risk being lost if SourceForge dies or purges projects it judges "non-profitable".
On the other hand, GitHub is a saner and healthier alternative for hosting these projects.

# What we do

*ASFMirror* is a collection of mirrors of such projects, on GitHub. Currently, the mirrored projects are:

* [kiki](kiki): kiki the nanobot is a 3-D puzzle game. It is basically a mixture of the games Sokoban and Kula-World. [[repo]](https://github.com/a-sf-mirror/kiki)
* [gusanos](gusanos): Project Gusanos is a 2D worms like game. [[repo]](https://github.com/a-sf-mirror/gusanos)
* [phlipple (no site)](https://github.com/a-sf-mirror/phlipple): Phlipple is a unique puzzle game. The goal of every level is to reduce a 3D shape to a single square. Elimination of squares is done by flipping edges around just like in a cardboard box. [[repo]](https://github.com/a-sf-mirror/phlipple)
* [FreeDroidRPG](http://www.freedroid.org/): FreedroidRPG is an isometric RPG game inspired by Diablo and Fallout. [[repo]](https://github.com/a-sf-mirror/freedroid)
* [vpinball (no site)](https://github.com/a-sf-mirror/vpinball): vpinball is a pinball game. [[repo]](https://github.com/a-sf-mirror/vpinball)
* [Scorched3D](http://www.scorched3d.co.uk/): Scorched 3D is a free and open source artillery game modeled after the MS-DOS game Scorched Earth. [[repo]](https://github.com/a-sf-mirror/scorched3d/)
* [zod (site has not been mirrored yet and is still on SF)](http://zod.sourceforge.net/): The Zod Engine is an open source remake of the 1996 game Z by the Bitmap Brothers written in C++ using the SDL library for Linux / Windows / Etc. [[repo]](https://github.com/a-sf-mirror/zod_engine)


**This list is open to expansion**: if you feel a project lacks a maintainership that could push the project elsewhere if sourceforge dies, you can send an email to `<sfmirror AT indigo DOT re>` so we just clone it here, or you can also [clone the project yourself](#how-to-clone-a-project-yourself) easily.

If your project was added here and you don't want that, you can also drop us a line.

# What content is mirrored of each project?

Currently, for each cloned project, we mirror its CVS (or SVN) repository and its website.

## CVS/SVN

The CVS/SVN repository of the project's code is converted to a git repository. If using CVS, There may be issues with CVS branches while mirroring.

## Website

The website of the project, if hosted on sourceforge (url in the form `http://<project name>.sf.net/`) is mirrored. All pages are statically downloaded, meaning if the website was dynamic, like a wiki, or blog, we will only get a fixed snapshot. This is because we don't have access to the site source or its database.
We try to do the smallest notifications possible for it to work (a few links are converted). The modifications are automated, and may contain errors. The website mirror is done to a git branch (named "gh-pages") of the project repo.

# How to clone a project yourself?

[This is the script we use to convert CVS to git.](sf-repo-to-git.zsh) It relies on "git-cvsimport" or "git-svn".

[This is the script we use to import the project site to gh-pages branch.](sf-site-to-gh.zsh) It uses wget.

