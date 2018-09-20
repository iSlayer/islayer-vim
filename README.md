# islayer-vim : David Lester's Vim Distribution


islayer-vim is a distribution of vim plugins and resources for Vim and Gvim.

It is a good starting point for anyone intending to use VIM for development running on Linux.

The distribution is completely customisable using a `~/.vimrc.local`, `~/.vimrc.bundles.local`, and `~/.vimrc.before.local` Vim RC files.

<Insert Image>

Unlike traditional VIM plugin structure, which similar to UNIX throws all files into common directories, making updating or disabling plugins a real mess, islayer-vim uses the [Vundle] plugin management system to have a well organized vim directory. Vundle also ensures that the latest versions of your plugins are installed and makes it easy to keep them up to date.

# Installation
## Requirements
To make all the plugins work, specifically [neocomplete](https://github.com/Shougo/neocomplete.vim), you need [vim with lua](https://github.com/Shougo/neocomplete.vim#requirements).

## Linux Installation

The easiest way to install islayer-vim is to fork or clone.

*Requires Git 1.7+ and Vim 7.3+*

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

Create a `~/.vimrc.before.local` file to define any customizations
that get loaded *before* the islayer-vim `.vimrc`.

### Call Structure of Related Files

1. `.vimrc.before` - islayer-vim before configuration
3. `.vimrc.before.local` - before user configuration
4. `.vimrc.bundles` - islayer-vim bundle configuration
6. `.vimrc.bundles.local` - local user bundle configuration
6. `.vimrc` - islayer-vim vim configuration
8. `.vimrc.local` - local user configuration

You may also want to update your `README.markdown` file so that the `bootstrap.sh` link points to your repository and your `bootstrap.sh`

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

## [NERDCommenter]

NERDCommenter allows you to wrangle your code comments, regardless of
filetype. View `help :NERDCommenter` or checkout my post on [NERDCommenter](http://spf13.com/post/vim-plugins-nerd-commenter).

**QuickStart** Toggle comments using `<Leader>c<space>` in Visual or Normal mode.

## [neocomplete]

Neocomplete is an amazing autocomplete plugin with additional support for snippets. It can complete simulatiously from the dictionary, buffer, omnicomplete and snippets. This is the one true plugin that brings Vim autocomplete on par with the best editors.

**QuickStart** Just start typing, it will autocomplete where possible

**Customizations**:

 * Automatically present the autocomplete menu
 * Support tab and enter for autocomplete
 * `<C-k>` for completing snippets using [Neosnippet](https://github.com/Shougo/neosnippet.vim).

![neocomplete image][autocomplete-img]

## [Syntastic]

Syntastic is a syntax checking plugin that runs buffers through external syntax
checkers as they are saved and opened. If syntax errors are detected, the user
is notified and is happy because they didn't have to compile their code or
execute their script to find them.

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

![fugitive image][fugitive-img]

## [Ack.vim]

Ack.vim uses ack to search inside the current directory for a pattern.
You can learn more about it with `:help Ack`

**QuickStart** :Ack

## [Tabularize]

Tabularize lets you align statements on their equal signs and other characters

**Customizations**:

 * `<Leader>a= :Tabularize /=<CR>`
 * `<Leader>a: :Tabularize /:<CR>`
 * `<Leader>a:: :Tabularize /:\zs<CR>`
 * `<Leader>a, :Tabularize /,<CR>`
 * `<Leader>a<Bar> :Tabularize /<Bar><CR>`

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

## [Airline]

Airline provides a lightweight themable statusline with no external dependencies. By default this configuration uses the symbols `‹` and `›` as separators for different statusline sections.

![airline image][airline-img]

## Snippets

It also contains a very complete set of [snippets](https://github.com/spf13/snipmate-snippets) for use with snipmate or [neocomplete].

## [PythonComplete]

TODO: Fill in

## [AutoClose]

TODO: Fill in

## [IndentGuides]

TODO: Fill in

## [Markdown]

TODO: Fill in

## [Preview]

TODO: Fill in

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

[Vundle]:https://github.com/gmarik/vundle
[NERDCommenter]:https://github.com/scrooloose/nerdcommenter
[NERDTree]:https://github.com/scrooloose/nerdtree
[neocomplete]:https://github.com/shougo/neocomplete
[Fugitive]:https://github.com/tpope/vim-fugitive
[Tagbar]:https://github.com/majutsushi/tagbar
[Syntastic]:https://github.com/scrooloose/syntastic
[Tabularize]:https://github.com/godlygeek/tabular
[Airline]:https://github.com/bling/vim-airline
[Ack.vim]:https://github.com/mileszs/ack.vim
[PythonComplete]:https://github.com/vim-scripts/pythoncomplete
[AutoClose]:https://github.com/spf13/vim-autoclose
[IndentGuides]:https://github.com/nathanaelkane/vim-indent-guides
[Markdown]:https://github.com/tpope/vim-markdown
[Preview]:https://github.com/spf13/vim-preview

[islayer-vim-img]:https://
[islayer-vimrc-img]:https://
[autocomplete-img]:https://i.imgur.com/90Gg7.png
[tagbar-img]:https://i.imgur.com/cjbrC.png
[fugitive-img]:https://
[nerdtree-img]:https://i.imgur.com/9xIfu.png
[airline-img]:https://i.imgur.com/D4ZYADr.png
