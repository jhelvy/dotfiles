Instructions for setting sublime text as the default text editor:

BUNDLE_ID="com.sublimetext.4"  # Change to com.sublimetext.3 if on ST3

# Plain text & common docs
duti -s $BUNDLE_ID .txt all
duti -s $BUNDLE_ID .text all
duti -s $BUNDLE_ID .md all
duti -s $BUNDLE_ID .markdown all
duti -s $BUNDLE_ID .mdown all
duti -s $BUNDLE_ID .mkd all
duti -s $BUNDLE_ID .rst all

# R package files (no extension — use full filename)
duti -s $BUNDLE_ID .R all
duti -s $BUNDLE_ID .r all
duti -s $BUNDLE_ID .Rmd all
duti -s $BUNDLE_ID .rmd all
duti -s $BUNDLE_ID .Rnw all
duti -s $BUNDLE_ID .Rprofile all
duti -s $BUNDLE_ID .Renviron all

# Web
duti -s $BUNDLE_ID .css all
duti -s $BUNDLE_ID .scss all
duti -s $BUNDLE_ID .sass all
duti -s $BUNDLE_ID .less all
duti -s $BUNDLE_ID .js all
duti -s $BUNDLE_ID .jsx all
duti -s $BUNDLE_ID .ts all
duti -s $BUNDLE_ID .tsx all
duti -s $BUNDLE_ID .vue all
duti -s $BUNDLE_ID .svelte all

# Data / config
duti -s $BUNDLE_ID .json all
duti -s $BUNDLE_ID .jsonc all
duti -s $BUNDLE_ID .json5 all
duti -s $BUNDLE_ID .yaml all
duti -s $BUNDLE_ID .yml all
duti -s $BUNDLE_ID .toml all
duti -s $BUNDLE_ID .ini all
duti -s $BUNDLE_ID .cfg all
duti -s $BUNDLE_ID .conf all
duti -s $BUNDLE_ID .config all
duti -s $BUNDLE_ID .env all
duti -s $BUNDLE_ID .properties all
duti -s $BUNDLE_ID .xml all
duti -s $BUNDLE_ID .plist all
duti -s $BUNDLE_ID .tsv all
duti -s $BUNDLE_ID .dsv all

# Shell / scripting
duti -s $BUNDLE_ID .sh all
duti -s $BUNDLE_ID .bash all
duti -s $BUNDLE_ID .zsh all
duti -s $BUNDLE_ID .fish all
duti -s $BUNDLE_ID .ksh all
duti -s $BUNDLE_ID .csh all
duti -s $BUNDLE_ID .command all

# Python
duti -s $BUNDLE_ID .py all
duti -s $BUNDLE_ID .pyw all
duti -s $BUNDLE_ID .pyi all
duti -s $BUNDLE_ID .ipynb all

# Ruby
duti -s $BUNDLE_ID .rb all
duti -s $BUNDLE_ID .rake all
duti -s $BUNDLE_ID .gemspec all
duti -s $BUNDLE_ID .Gemfile all

# PHP
duti -s $BUNDLE_ID .php all
duti -s $BUNDLE_ID .php3 all
duti -s $BUNDLE_ID .php4 all
duti -s $BUNDLE_ID .phtml all

# Java / JVM
duti -s $BUNDLE_ID .java all
duti -s $BUNDLE_ID .kt all
duti -s $BUNDLE_ID .kts all
duti -s $BUNDLE_ID .groovy all
duti -s $BUNDLE_ID .scala all
duti -s $BUNDLE_ID .clj all
duti -s $BUNDLE_ID .gradle all

# C / C++ / C#
duti -s $BUNDLE_ID .c all
duti -s $BUNDLE_ID .h all
duti -s $BUNDLE_ID .cpp all
duti -s $BUNDLE_ID .cc all
duti -s $BUNDLE_ID .cxx all
duti -s $BUNDLE_ID .hpp all
duti -s $BUNDLE_ID .hxx all
duti -s $BUNDLE_ID .cs all

# Go / Rust / Swift
duti -s $BUNDLE_ID .go all
duti -s $BUNDLE_ID .rs all
duti -s $BUNDLE_ID .swift all

# SQL
duti -s $BUNDLE_ID .sql all
duti -s $BUNDLE_ID .sqlite all

# Logs & misc text
duti -s $BUNDLE_ID .log all
duti -s $BUNDLE_ID .out all
duti -s $BUNDLE_ID .diff all
duti -s $BUNDLE_ID .patch all

# Build / project files
duti -s $BUNDLE_ID .makefile all
duti -s $BUNDLE_ID .cmake all
duti -s $BUNDLE_ID .dockerfile all
duti -s $BUNDLE_ID .Dockerfile all
duti -s $BUNDLE_ID .gitignore all
duti -s $BUNDLE_ID .gitattributes all
duti -s $BUNDLE_ID .editorconfig all
duti -s $BUNDLE_ID .htaccess all
duti -s $BUNDLE_ID .npmrc all
duti -s $BUNDLE_ID .nvmrc all
duti -s $BUNDLE_ID .prettierrc all
duti -s $BUNDLE_ID .eslintrc all
duti -s $BUNDLE_ID .babelrc all

# LaTeX
duti -s $BUNDLE_ID .tex all
duti -s $BUNDLE_ID .bib all
duti -s $BUNDLE_ID .sty all
duti -s $BUNDLE_ID .cls all

# Template formats
duti -s $BUNDLE_ID .njk all
duti -s $BUNDLE_ID .jinja all
duti -s $BUNDLE_ID .jinja2 all
duti -s $BUNDLE_ID .hbs all
duti -s $BUNDLE_ID .mustache all
duti -s $BUNDLE_ID .ejs all
duti -s $BUNDLE_ID .liquid all

echo "Done! Sublime Text is now the default for all listed file types."