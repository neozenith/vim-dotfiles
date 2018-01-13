" Author: Josh Peak
" Date: 2017-JAN-17
" Description: This is ONLY plugin loading and should not contain plugin
" configuration.
set encoding=utf-8
scriptencoding utf-8

" ---------------------------
" Plugins: Vundle
" ---------------------------
" {
set nocompatible
filetype off

" Setup Runtime Path:
if has('win64') || has('win32') || has('win16')
  set rtp+=$HOME/vimfiles/bundle/Plug.vim
  call plug#begin('$HOME/vimfiles/bundle/')
else
  set rtp+=~/.vim/bundle/Plug.vim
  call plug#begin()
endif

" -------------------
"  Compulsory Components of Any Dev Environment
"  1. Syntax Coloring / Nested Bracket Coloring
"  2. Code Folding
"  3. Jump to Definition
"  4. File Explorer
"  5. Tabbed Workspace
"  6. AutoComplete
"    i.   Key Words and closing symbols for target language
"    ii.  Project Methods, Symbols and Variables
"    iii. Framework Methods and Symbols
"  7. Auto Syntax Checking
"  8. Auto Style Checking
"  9. Auto Linting
"  10. Version Control Integration
"    i. Live Diff
"    ii. Live branch name and status
"  11. Search & Replace with RegEx
"  12. Highlight matching brackets
"  13. Undo History
"  14. Auto testing TODO
"    i. unit tests TODO
"    ii. code coverage coloring TODO
"  15. Command Pallette (See VS Code, Sublime)
" -------------------

" INTERFACE
Plug 'scrooloose/nerdtree'              " File Explorer
Plug 'Xuyuanp/nerdtree-git-plugin'      " Git status in file explorer
Plug 'scrooloose/nerdcommenter'         " Toggle Commenting
Plug 'sjl/gundo.vim'                    " Undo History
Plug 'nathanaelkane/vim-indent-guides'  " Visualise Indent Levels
Plug 'kien/rainbow_parentheses.vim'     " Rainbow Color Parenthesis Nesting

" GIT Integerations
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'airblade/vim-gitgutter' " Live Git Diff symbols in left gutter
" Note to self: Git Diff article explaining how to 3 way merge with Vim
" http://vimcasts.org/episodes/fugitive-vim-resolving-merge-conflicts-with-vimdiff/

" STATUS LINE

Plug 'itchyny/lightline.vim'  " Status bar

" SYNTAX CHECKER + HIGHLIGHTING

Plug 'sheerun/vim-polyglot'   " 100+ Syntax highlighters

Plug 'scrooloose/syntastic'   " Syntax Check engine
Plug 'Chiel92/vim-autoformat' " Autoformat XML, JSON etc with :Autoformat

" MARKDOWN
" https://github.com/plasticboy/vim-markdown
" Some useful tools to make vim generate and maintain
" markdown documents. Useful when CMS tools expect markdown input.
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" CODE COMPLETION
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'vim-scripts/dbext.vim'  " SQL Autocomplete and also SQL querying
Plug 'szw/vim-tags'

if has('win64') || has('win32') || has('win16')
  " No YCM Support for now
else
  Plug 'Valloric/YouCompleteMe' " Auto Complete Engine
endif

" COMMAND PALETTE
Plug 'ctrlpvim/ctrlp.vim'
Plug 'fisadev/vim-ctrlp-cmdpalette'


" C++ Dev
" Ensure .ycm_extra_conf.py is filled out so compiler directives are set.
" There is a default one in this repo that links to root user dir but it
" should be copied into and configured per project.
" http://valloric.github.io/YouCompleteMe/#c-family-semantic-completion
" https://jonasdevlieghere.com/a-better-youcompleteme-config/
"
Plug 'tpope/vim-dispatch'     " Run build and test jobs asynchronously with :Make
"
" https://github.com/alepez/vim-gtest
" Plug 'alepez/vim-gtest'       " Unit Testing Framework
"
" https://github.com/alepez/vim-llvmcov
" Plug 'alepez/vim-llvmcov'     " Code Covereage
"
Plug 'pboettch/vim-cmake-syntax'        " CMake Syntax Highlighting
Plug 'octol/vim-cpp-enhanced-highlight' " smarter c++ highlight for c++11/14/17

" # RUBY DEV
Plug 'vim-ruby/vim-ruby'
Plug 'ngmy/vim-rubocop'       " Ruby Syntax and Style Checker
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rake'
Plug 'reinh/vim-makegreen'

" # WEB DEV

" Emmet HTML tag expander
" type: html:5
" to expand: ctrl-y ,
Plug 'mattn/emmet-vim'        " HTML/XML Tag Expander

Plug 'gregsexton/matchtag'    " HTML/XML Matching Tag Highlighter
Plug 'marijnh/tern_for_vim'   " JavaScript AutoComplete
Plug 'elzr/vim-json'          " JSON Style Checker
Plug 'ap/vim-css-color'       " Preview CSS colours with text highlighting
Plug 'othree/html5.vim'       " HTML5 AutoComplete
Plug 'othree/yajs.vim'        " YetAnotherJS syntax checker/highlighter
Plug 'w0rp/ale'								" Async Lint Engine to reduce lag after save running linting

" # PYTHON DEV
Plug 'fs111/pydoc.vim'
Plug 'alfredodeza/pytest.vim'

" Patched Fonts:
" Must be last plugin to load
" https://github.com/ryanoasis/nerd-fonts/releases
" https://github.com/ryanoasis/nerd-fonts/releases/download/v1.0.0/Hack.zip (9Mb)
Plug 'ryanoasis/vim-devicons' " Patched Fonts integrations

call plug#end()
