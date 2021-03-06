" Author: Josh Peak
" Date: 2017-JAN-17
" Description: This is ONLY plugin loading and should not contain plugin
" configuration.
set encoding=utf-8
scriptencoding utf-8

" ---------------------------
" Plugins: https://github.com/junegunn/vim-plug
" ---------------------------
" {
set nocompatible
filetype off

" plug.vim must appear in an autoload folder in the runtime path
" check runtimepath with
" :set runtimepath?
call plug#begin()
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
"  14. Auto testing (Run as npm task in other terminal)
"    i. unit tests
"    ii. code coverage coloring
"  15. Command Pallette (See VS Code, Sublime)
"  16. Finds all references in project
"  17. Refactor Rename
" -------------------

" INTERFACE:
Plug 'neozenith/estilo-xoria256'              " Custom Xoria256 colorscheme

Plug 'scrooloose/nerdtree'              " File Explorer
Plug 'Xuyuanp/nerdtree-git-plugin'      " Git status in file explorer
Plug 'scrooloose/nerdcommenter'         " Toggle Commenting
Plug 'sjl/gundo.vim'                    " Undo History
" Plug 'ludovicchabant/vim-gutentags'     " Auto Tag management, cross platform and dependency free
Plug 'majutsushi/tagbar'                " Display heirarchy of classes and functions

" GIT Integerations:
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter' " Live Git Diff symbols in left gutter
" Note to self: Git Diff article explaining how to 3 way merge with Vim
" http://vimcasts.org/episodes/fugitive-vim-resolving-merge-conflicts-with-vimdiff/

" STATUS LINE:
Plug 'itchyny/lightline.vim'  " Status bar

" CODE STYLE: Syntax Higlighting, Linting, Formatting
Plug 'sheerun/vim-polyglot'   " 100+ Syntax highlighters
" ALE linting events
if (v:version >= 800)
  Plug 'w0rp/ale'               " Async Lint Engine to reduce lag after save running linting
  Plug 'maximbaz/lightline-ale' " Plugin to get lightline summary numbers from ALE
  " Plug 'neozenith/lightline-ale' " Plugin to get lightline summary numbers from ALE
else
  " NOTE: Should probably fallback to Syntastic but I can't be bothered
  " maintaing that when I have no need.
  echoerr "These dotfiles require NeoVim or Vim 8"
endif
Plug 'Chiel92/vim-autoformat' " Autoformat XML, JSON etc with :Autoformat
Plug 'nathanaelkane/vim-indent-guides'  " Visualise Indent Levels
Plug 'kien/rainbow_parentheses.vim'     " Rainbow Color Parenthesis Nesting

" AUTO COMPLETE:
Plug 'tpope/vim-surround'     " Adds the (s)urround text object. eg cs') 'this' -> (this)
Plug 'tpope/vim-endwise'      " Adds end closures to if statements and while loops etc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scalameta/coc-metals', {'do': 'yarn install --frozen-lockfile'}

Plug 'derekwyatt/vim-scala'
if (has('python') || has('python3'))
  if(has('macunix'))
    " Plug 'Valloric/YouCompleteMe', { 'do': './install.py --build-dir $HOME/ycm-build --js-completer --ts-completer --go-completer --rust-completer --clang-completer --clang-tidy' } " Auto Complete Engine
  else
    " Plug 'Valloric/YouCompleteMe', { 'do': './install.py --build-dir $HOME/ycm-build' } " Auto Complete Engine
  endif
endif
" YCM RPi Suppport:
" https://nallerooth.com/post/building_ycm_on_raspberry_pi_3/
" Limit cores to keep RAM usage low.
" YCM_CORES=1 ./install.py
" YCM Windows Support:
" Install CMake: https://cmake.org/download/
" OPTION 1:
"     Install MS Build Tools: https://visualstudio.microsoft.com/downloads/
" OPTION 2:
"   Install LLVM Clang: http://releases.llvm.org/download.html
"   Install Ninja: https://github.com/ninja-build/ninja/releases
"
"   https://metricpanda.com/rival-fortress-update-27-compiling-with-clang-on-windows
"   https://stackoverflow.com/a/46593308/622276
"   Run this: cmake -H. -G Ninja -Bbuild \
"   -DCMAKE_C_FLAGS=TRUE -DCMAKE_CXX_FLAGS=TRUE \
"   -DCMAKE_C_COMPILER="C:/Program Files/LLVM/bin/clang.exe" \
"   -DCMAKE_CXX_COMPILER="C:/Program Files/LLVM/bin/clang.exe" \
"   -DCMAKE_LINKER="C:/Program Files/LLVM/bin/lld-link.exe"
"
" OPTIONALLY Install: Rust, Node, GoLang
" By specifying a build dir this caches results of the basic build. Subsequent
" builds can add extra completers as appropriate. Eg
"
" python ~/dotfiles/.vim/plugged/YouCompleteMe/install.py --build-dir $HOME/ycm-build --js-completer --ts-completer

" SQL:
Plug 'vim-scripts/dbext.vim', {'for': 'sql'}  " SQL Autocomplete and also SQL querying

" SNIPPETS: See .vim/custom_snippets/README.md
" Plug 'SirVer/ultisnips'     " Snippet Engine

" COMMAND PALETTE:
Plug 'ctrlpvim/ctrlp.vim'
Plug 'fisadev/vim-ctrlp-cmdpalette'

" WEB DEV:
" Emmet HTML tag expander
" type: html:5
" to expand: ctrl-y ,
Plug 'mattn/emmet-vim'        " HTML/XML Tag Expander

" https://davidosomething.com/blog/vim-for-javascript/
Plug 'pangloss/vim-javascript'    " Javascript syntax highlighting
Plug 'leafgarland/typescript-vim' "Typescript syntax highlighting
Plug 'gregsexton/matchtag'    " HTML/XML Matching Tag Highlighter
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' } " JavaScript AutoComplete

Plug 'elzr/vim-json'          " JSON Style Checker
Plug 'josudoey/vim-eslint-fix' " ESLint auto fix
" Plug 'ap/vim-css-color'       " Preview CSS colours with text highlighting
" Plug 'gko/vim-coloresque'     " Preview CSS colours. Works better than ap/vim/css-color. Awaiting YAML FT support merge request
Plug 'neozenith/vim-coloresque' " Preview CSS colours
Plug 'othree/html5.vim'       " HTML5 AutoComplete
Plug 'othree/yajs.vim',       " YetAnotherJS syntax checker/highlighter
Plug 'joegesualdo/jsdoc.vim', " Generate JSDoc block from method definition

" Show code coverage symbols. Requires Vim 8 or higher
if (v:version >= 800)
  Plug 'ruanyl/coverage.vim'
  let g:coverage_json_report_path = 'coverage/coverage-final.json'
  let g:coverage_show_uncovered = 1
endif


" R:
" https://medium.freecodecamp.org/turning-vim-into-an-r-ide-cd9602e8c217

" ARDUINO DEV:
" Plug 'stevearc/vim-arduino'
" Plug 'neozenith/vim-arduino'

" PYTHON DEV:
" https://rapphil.github.io/vim-python-ide/
Plug 'fs111/pydoc.vim', {'for': 'python'}         " Programmatically integrate PyDoc lookups
Plug 'alfredodeza/pytest.vim', {'for': 'python'}  " Pytest tooling
Plug 'alfredodeza/coveragepy.vim', {'for': 'python'}     " Refactoring tool

" Require Vim to be built with Python integration
if (has('python') || has('python3'))
  Plug 'davidhalter/jedi-vim', {'for': 'python'}    " Autocompletion and static analysis
  Plug 'mgedmin/coverage-highlight.vim', {'for': 'python'}
endif

" MARKDOWN:
" https://github.com/plasticboy/vim-markdown
" Some useful tools to make vim generate and maintain
" markdown documents. Useful when CMS tools expect markdown input.
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" RUBY DEV:
Plug 'vim-ruby/vim-ruby', {'for': 'ruby'}
Plug 'ngmy/vim-rubocop', {'for': 'ruby'}      " Ruby Syntax and Style Checker
Plug 'tpope/vim-bundler', {'for': 'ruby'}

" C++ Dev
" Ensure .ycm_extra_conf.py is filled out so compiler directives are set.
" There is a default one in this repo that links to root user dir but it
" should be copied into and configured per project.
" http://valloric.github.io/YouCompleteMe/#c-family-semantic-completion
" https://jonasdevlieghere.com/a-better-youcompleteme-config/
"
" Plug 'tpope/vim-dispatch'     " Run build and test jobs asynchronously with :Make
"
" https://github.com/alepez/vim-gtest
" Plug 'alepez/vim-gtest'       " Unit Testing Framework
"
" https://github.com/alepez/vim-llvmcov
" Plug 'alepez/vim-llvmcov'     " Code Covereage
"
Plug 'pboettch/vim-cmake-syntax'        " CMake Syntax Highlighting
Plug 'octol/vim-cpp-enhanced-highlight', {'for': 'cpp'} " smarter c++ highlight for c++11/14/17


" Patched Fonts:
" Must be last plugin to load
" https://github.com/ryanoasis/nerd-fonts/releases
" https://github.com/ryanoasis/nerd-fonts/releases/download/v1.0.0/Hack.zip (9Mb)
Plug 'ryanoasis/vim-devicons' " Patched Fonts integrations

call plug#end()

colorscheme xoria256
" augroup javascript_colorscheme
"     au!
"     au FileType javascript colorscheme tender
" augroup END
