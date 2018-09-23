# islayer-vim : David Lester's Vim Distribution
[![Build Status](https://travis-ci.com/iSlayer/islayer-vim.svg?branch=master)](https://travis-ci.com/iSlayer/islayer-vim)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![codecov](https://codecov.io/gh/iSlayer/islayer-vim/branch/master/graph/badge.svg)](https://codecov.io/gh/iSlayer/islayer-vim)

islayer-vim is a distribution of vim plugins and resources for Vim and Gvim.

It is a good starting point for anyone intending to use VIM for development running on Linux.

The distribution is completely customisable using a `~/.vimrc.local` and `~/.vimrc.bundles.local` Vim RC files.

<Insert Image>

Unlike traditional VIM plugin structure, which similar to UNIX throws all files into common directories, making updating or disabling plugins a real mess, islayer-vim uses the [Vundle] plugin management system to have a well organized vim directory. Vundle also ensures that the latest versions of your plugins are installed and makes it easy to keep them up to date.

# Installation
## Requirements
To make all the plugins work, specifically [neocomplete](https://github.com/Shougo/neocomplete.vim), you need [vim with lua](https://github.com/Shougo/neocomplete.vim#requirements).

## Linux Installation

*Requires Git 1.7+ and Vim 7.3+*

The easiest way to install islayer-vim is to fork or clone. Run the following command:
```bash
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
```

Open a vim and run the command:
```vim script
    :PluginInstall<CR>
```

All the plugins should be installed now!

# A highly optimized .vimrc config file

<Insert Image>

The .vimrc file is suited to programming. It is extremely well organized and folds in sections.
Each section is labeled and each option is commented.

It fixes many of the inconveniences of vanilla vim including

 * Eliminates swap and backup files from littering directories, preferring to store in a central location.
 * Setup the interface to take advantage of vim's features including
   * line numbers
   * syntax highlighting
   * A better ruler & status line
   * & more
 * Configuring included plugins

## Customization

Create `~/.vimrc.local` and `~/.gvimrc.local` for any local customizations.

For example, to override the default color schemes:

```bash
    echo colorscheme ir_black  >> ~/.vimrc.local
```

### Before File

Create a `~/.vimrc.local` file to define any customizations
that get loaded *before* the islayer-vim `.vimrc`.

### Call Structure of Related Files

1. `.vimrc`               - vim configuration
2. `.vimrc.bundles`       - bundle configuration
3. `.vimrc.bundles.local` - user bundle configuration
4. `.vimrc.local`         - user vimrc configuration
5. `.gvimrc.local`        - user gvimrc configuration
6. `.vim/settings.vim`    - bundle settings configuration

You may also want to update your `README.markdown` file so that the `install.sh` link points to your repository and your `bootstrap.sh`

# Plugins

islayer-vim contains a curated set of popular vim plugins, snippets and syntaxes. Great care has been made to ensure that these plugins play well together and have optimal configuration.

## Adding new plugins

Create `~/.vimrc.bundles.local` for any additional bundles.

To add a new bundle, just add one line for each bundle you want to install. The line should start with the word "Bundle" followed by a string of either the vim.org project name or the githubusername/githubprojectname. For example, the github project [klen/python-mode](https://github.com/klen/python-mode) can be added with the following command

```bash
    echo Bundle \'klen/python-mode\' >> ~/.vimrc.bundles.local
```

Once new plugins are added, they have to be installed.

```bash
    vim +BundleInstall! +BundleClean +q
```

## Removing (disabling) an included plugin

Create `~/.vimrc.local` if it doesn't already exist.

Add the UnBundle command to this line. It takes the same input as the Bundle line, so simply copy the line you want to disable and add 'Un' to the beginning.

For example, disabling the 'scrooloose/syntastic' plugin

```bash
    echo UnBundle \'scrooloose/syntastic\' >> ~/.vimrc.bundles.local
```

**Remember to run ':BundleClean!' after this to remove the existing directories**

## [AutoClose]

Autoclose inserts a closing brace. Features:
* Typing ``(`` will result in (|), where | is the cursor position and the double backticks are just marking input. Typing a ``)`` will move the cursor outside the parens. This moving outside works even in nested scenarios. 
  * Typing ``if(my_array['key`` results in ``if(my_array['key|'])`` and ``)`` gets you ``if(my_array['key'])|``
* The paired characters are: [, (, {, ", '

## [Airline]

Airline provides a lightweight themable statusline with no external dependencies. By default this configuration uses the symbols `‹` and `›` as separators for different statusline sections.

![airline image][airline-img]

## [Devicons]

Adds filetype glyphs (icons) to various vim plugins, but requires [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts).

![devicons image][devicons-img]

## [Emmet]

Emmet-vim is a vim plug-in which provides support for expanding abbreviations.

![emmet image][emmet-img]

## [Flake8]

A Vim plugin that runs the currently open file through Flake8, a static syntax and style checker for Python source code. It supersedes both vim-pyflakes and vim-pep8.<br/> <br/>
Flake8 is a wrapper around PyFlakes, PEP8, and Ned's MacCabe script.

## [Fugitive]

Fugitive adds pervasive git support to git directories in vim. For more
information, use `:help fugitive`

Use `:Gstatus` to view `git status` and type `-` on any file to stage or
unstage it. Type `p` on a file to enter `git add -p` and stage specific
hunks in the file.

Use `:Gdiff` on an open file to see what changes have been made to that
file

**QuickStart** `<leader>gs` to bring up git status

**Customizations**:

 * `<leader>gs` :Gstatus<CR>
 * `<leader>gd` :Gdiff<CR>
 * `<leader>gc` :Gcommit<CR>
 * `<leader>gb` :Gblame<CR>
 * `<leader>gl` :Glog<CR>
 * `<leader>gp` :Git push<CR>
 * `<leader>gw` :Gwrite<CR>
 * :Git ___ will pass anything along to git.

## [Markdown]

This is the development version of Vim's included syntax highlighting and filetype plugins for Markdown. Generally you don't need to install these if you are running a recent version of Vim.

## [MarkdownPreview]

Preview plugin is a tool developed to help you to preview markup files such as .markdown, .rdoc, .textile and .html when you are editing them. It builds html files and opens them in your browser. Features:
* markdown(md, mkd, mkdn, mdown) - depends on `bluecloth` ruby gem
* rdoc - depends on `github-markup` ruby gem
* textile - depends on `RedCloth` ruby gem
* html(htm)
* ronn - depends on `ronn` ruby gem
* reStructuredText(rst) - depends on `RbST` ruby gem and `rst2html` system util

## [Neocomplete]

Neocomplete is an amazing autocomplete plugin with additional support for snippets. It can complete simulatiously from the dictionary, buffer, omnicomplete and snippets. This is the one true plugin that brings Vim autocomplete on par with the best editors.

**QuickStart** Just start typing, it will autocomplete where possible

**Customizations**:

 * Automatically present the autocomplete menu
 * Support tab and enter for autocomplete
 * `<C-k>` for completing snippets using [Neosnippet](https://github.com/Shougo/neosnippet.vim).

![neocomplete image][neocomplete-img]

## [NERDCommenter]

NERDCommenter allows you to wrangle your code comments, regardless of
filetype. View `help :NERDCommenter` or checkout my post on [NERDCommenter](http://spf12.com/post/vim-plugins-nerd-commenter).

**QuickStart** Toggle comments using `<Leader>c<space>` in Visual or Normal mode.
http://animefreak.tv/watchon/boruto-naruto-next-generations-episode-73-online

## [NERDTree]

NERDTree is a file explorer plugin that provides "project drawer"
functionality to your vim editing.  You can learn more about it with
`:help NERDTree`.

**QuickStart** Launch using `<Leader>e`.

**Customizations**:

* Use `<C-E>` to toggle NERDTree
* Use `<leader>e` or `<leader>nt` to load NERDTreeFind which opens NERDTree where the current file is located.
* Hide clutter ('\.pyc', '\.git', '\.hg', '\.svn', '\.bzr')
* Treat NERDTree more like a panel than a split.

![nerdtree image][nerdtree-img]

## [NERDTree Syntax Highlight]

Adds syntax for nerdtree on most common file extensions. This is intended to be used with [Devicons] to add color to icons or entire labels.

![nerdtree syntax highlight image][nerdtreehighlight-img]

## [Onedark]

A dark Vim color scheme for the GUI, based on FlatColor, with colors inspired by the excellent One Dark syntax theme.

![onedark image][onedark-img1]
![onedark image][onedark-img2]

## [PythonComplete]

This is the pythoncomplete omni-completion script shipped with vim 7. Features:
* Dynamic type deduction
* Local visibility handling
* completeopt=preview support, displaying python docstrings
* Function argument completion

## [PythonMode]

Python-mode is a Vim plugin that magically converts Vim into a Python IDE. Features:

* Support Python version 2.6+ and 3.2+
* Syntax highlighting
* Virtualenv support
* Run python code (`<leader>r`)
* Add/remove breakpoints (`<leader>b`)
* Improved Python indentation
* Python motions and operators (`]]`, `3[[`, `]]M`, `vaC`, `viM`, `daC`, `ciM`, ...)
* Improved Python folding
* Run multiple code checkers simultaneously (`:PymodeLint`)
* Autofix PEP8 errors (`:PymodeLintAuto`)
* Search in python documentation (`<leader>K`)
* Code refactoring
* Intellisense code-completion
* Go to definition (`<C-c>g`)
* And more, more ...

## [Python]

This plugin can be useful when editing Python scripts. Features:
* Select a block of lines with the same indentation
* Select a function
* Select a class
* Go to previous/next class/function
* Go to the beginning/end of a block
* Comment/uncomment the selection
* Jump to the last/next line with the same indent
* Shift a block (left/right)
* Creates list of classes and functions for easy code navigation

## [Snippets]

It also contains a very complete set of [snippets](https://github.com/spf13/snipmate-snippets) for use with snipmate or [neocomplete].

## [Syntastic]

Syntastic is a syntax checking plugin that runs buffers through external syntax
checkers as they are saved and opened. If syntax errors are detected, the user
is notified and is happy because they didn't have to compile their code or
execute their script to find them.

![syntastic image][syntastic-img]

## [Tagbar]

islayer-vim includes the Tagbar plugin. This plugin requires exuberant-ctags and will automatically generate tags for your open files. It also provides a panel to navigate easily via tags

**QuickStart** `CTRL-]` while the cursor is on a keyword (such as a function name) to jump to its definition.

**Customizations**: islayer-vim binds `<Leader>tt` to toggle the tagbar panel

![tagbar image][tagbar-img]

**Note**: For full language support, run `brew install ctags` to install
exuberant-ctags.

**Tip**: Check out `:help ctags` for information about VIM's built-in
ctag support. Tag navigation creates a stack which can traversed via
`Ctrl-]` (to find the source of a token) and `Ctrl-T` (to jump back up
one level).

![tagbar image][tagbar-img1]
![tagbar image][tagbar-img2]

# TODO:
* Change devicons colors
* Change airline icons

# Intro to VIM

Here's some tips if you've never used VIM before:

## Tutorials

* Type `vimtutor` into a shell to go through a brief interactive
  tutorial inside VIM.
* Read the slides at [VIM: Walking Without Crutches](https://walking-without-crutches.heroku.com/#1).

## Modes

* VIM has two (common) modes:
  * insert mode- stuff you type is added to the buffer
  * normal mode- keys you hit are interpreted as commands
* To enter insert mode, hit `i`
* To exit insert mode, hit `<ESC>`

## Useful commands

* Use `:q` to exit vim
* Certain commands are prefixed with a `<Leader>` key, which by default maps to `\`.
  islayer-vim uses `let mapleader = ","` to change this to `,` which is in a consistent and
  convenient location.
* Keyboard [cheat sheet](http://www.viemu.com/vi-vim-cheat-sheet.gif).

[Git]:http://git-scm.com
[Curl]:http://curl.haxx.se
[Vim]:http://www.vim.org/download.php#pc
[islayer-vim]:https://github.com/islayer/islayer-vim

[Airline]:https://github.com/bling/vim-airline
[AutoClose]:https://github.com/spf13/vim-autoclose
[Devicons]:https://github.com/ryanoasis/vim-devicons
[Emmet]:https://github.com/mattn/emmet-vim
[Flake8]:https://github.com/nvie/vim-flake8
[Fugitive]:https://github.com/tpope/vim-fugitive
[Markdown]:https://github.com/tpope/vim-markdown
[MarkdownPreview]:https://github.com/spf13/vim-preview
[Neocomplete]:https://github.com/shougo/neocomplete
[NERDCommenter]:https://github.com/scrooloose/nerdcommenter
[NERDTree]:https://github.com/scrooloose/nerdtree
[NERDTree syntax highlight]:https://github.com/tiagofumo/vim-nerdtree-syntax-highlight
[Onedark]:https://github.com/joshdick/onedark.vim
[Python]:https://github.com/yssource/python.vim
[PythonComplete]:https://github.com/vim-scripts/pythoncomplete
[PythonMode]:https://github.com/python-mode/python-mode
[Preview]:https://github.com/spf13/vim-preview
[Snippets]:https://github.com/honza/vim-snippets
[Syntastic]:https://github.com/scrooloose/syntastic
[Tagbar]:https://github.com/majutsushi/tagbar
[Vundle]:https://github.com/gmarik/vundle

[islayer-vim-img]:https://
[islayer-vimrc-img]:https://
[airline-img]:https://github.com/vim-airline/vim-airline/wiki/screenshots/demo.gif
[devicons-img]:https://raw.githubusercontent.com/wiki/ryanoasis/vim-devicons/screenshots/v0.10.x/overall-screenshot.png
[emmet-img]:https://raw.githubusercontent.com/mattn/emmet-vim/master/doc/screenshot.gif
[neocomplete-img]:https://camo.githubusercontent.com/2135f9b37963594325b304a7a57163b5b6ab8b11/68747470733a2f2f662e636c6f75642e6769746875622e636f6d2f6173736574732f3231343438382f3632333135312f32383461643836652d636635622d313165322d383238652d3235376433316266303537322e706e67
[nerdtree-img]:https://raw.githubusercontent.com/scrooloose/nerdtree/master/screenshot.png
[nerdtreehighlight-img]:https://github.com/tiagofumo/vim-nerdtree-syntax-highlight/blob/master/screenshots/allfiles.png
[onedark-img1]:https://raw.githubusercontent.com/joshdick/onedark.vim/master/img/readme_header.png
[onedark-img2]:https://camo.githubusercontent.com/06e2b3773a0173ae65f8e6eb6b307771b5a7c737/68747470733a2f2f7261772e6769746875622e636f6d2f6a6f73686469636b2f6f6e656461726b2e76696d2f6d61737465722f696d672f707265766965775f6c696768746c696e652e706e67
[syntastic-img]:https://raw.githubusercontent.com/vim-syntastic/syntastic/master/_assets/screenshot_1.png
[tagbar-img1]:https://camo.githubusercontent.com/fc85311154723793776aed28488befdfaab36c42/68747470733a2f2f692e696d6775722e636f6d2f5366394c7332722e706e67
[tagbar-img2]:https://camo.githubusercontent.com/f5065c1dda4cbd6df6eed89c4086e31fc1774b2e/68747470733a2f2f692e696d6775722e636f6d2f6e3462705076332e706e67
