# Doug's dotfiles

My dotfiles: intended as a repository for my own use, 
but others may find this helpful.

## Install
To download **and install** using git:
```bash
git clone https://github.com/doughague/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install
```

Note that it might be handy to put these files in something like 
`Projects/dotfiles` and sym-link to `~/.dotfiles`. 

## Modify

### GNU stow
GNU Stow is a program, which allows you to create symbolic links out 
of one base directory. The Stow base directory of this template is named 
`.dotfiles` and should be saved in the home folder (`~/.dotfiles`). 

The  stow the base directory should follow a certain structure:
```
~/[stow dir]/[random name]/[content]
~/.dotfiles/git/.gitconfig
```

For example, when executing `stow git`, Stow makes symblolic links from the content 
of the git folder to `~/.gitconfig`.
This also works for home sub-folders like `~/.config`: `~/.dotfiles/config/.config/`

### Private
You can set bash stuff that is not published to git by creating 
a `~/.dotfiles/bash/bash.d/private` file. 
See `~/.dotfiles/bash/bash.d/private.example` for an example. 

## License
GNU General Public License, version 3.0. 
See License.txt for complete license infromation.

### Inspiration
This software was developed using the following packages:

 * [GNU stow template](https://github.com/Paradiesstaub/gnu_stow_template):
   The MIT License (MIT), Copyright (c) 2014 Thibaut Brandscheid
 * [Mathias’s dotfiles](https://github.com/mathiasbynens/dotfiles):
   The MIT License (MIT), Copyright Mathias Bynens <http://mathiasbynens.be/>

### Contains
This contains the following GNU emacs packages:

 * [CEDET](http://cedet.sourceforge.net/):
   GNU General Public License version 2.0
 * [ECB](http://ecb.sourceforge.net/):
   GNU General Public License version 2.0
 * [auto-complete-1.3.1](http://cx4a.org/software/auto-complete/):
   GNU General Public License version 3.0
 * [color-theme-6.6.0](http://www.nongnu.org/color-theme/index.html):
   GNU General Public License version 2.0
 * [auto-pair](http://autopair.googlecode.com):
   GNU General Public License version 3.0, Copyright (C) 2009,2010 Joao Tavora
 * [cmake-mode](http://www.cmake.org/CMakeDocs/cmake-mode.el):
   BSD License, Copyright 2000-2009 Kitware, Inc., Insight Software Consortium
 * [color-theme-tango](http://www.emacswiki.org/emacs/color-theme-tango.el):
   Created by danranx@gmail.com.
 * [markdown-mode](http://jblevins.org/projects/markdown-mode/):
   GNU General Public License version 2.0, Copyright (C) 2007-2011 Jason R. Blevins <jrblevin@sdf.org>
 * [yasnippet-bundle](http://code.google.com/p/yasnippet/):
   GNU General Public License version 2.0, Copyright 2009 pluskid, joaotavora
