Instructions for setting up new mac, including all R packages

# Software to install:

- [Python 3](https://www.python.org/downloads/)
- [R](https://cloud.r-project.org/)
- [Rstudio](https://rstudio.com/products/rstudio/download/)
- [XQuartz](https://www.xquartz.org/)
- [Quarto](https://quarto.org/docs/get-started/)
- [Sublime Text 3](https://www.sublimetext.com/)
- [Alt tab](https://alt-tab-macos.netlify.app/)
- [Karabiner-Elements](https://karabiner-elements.pqrs.org/)
- [Homebrew: https://brew.sh/](https://brew.sh/)
- [Alfred 5](https://www.alfredapp.com/)
- [Whatpulse](https://whatpulse.org/)
- [GitHub Desktop](https://desktop.github.com/)
- [Brave browser](https://brave.com/)
- [Google Chrome](https://www.google.com/chrome/)
- [pCloud Drive](https://www.pcloud.com/download-free-online-cloud-file-storage.html)
- [shortcat](https://shortcat.app/)
- Easy CSV Editor (apple store)
- [Box](https://www.box.com/resources/downloads)
- [Espanso](https://espanso.org/)
- [GWU VPN](https://it.gwu.edu/virtual-private-network-vpn)
- [VLC](https://www.videolan.org/vlc/)
- [Zoom](https://zoom.us/support/download)
- [Zotero](https://www.zotero.org/download/)
- [Microsoft Office](https://www.seas.gwu.edu/software-licenses)

# General Settings: 

- Set and sync pCloud sync folder to Users/jhelvy/sync
- Login to Dropbox and sync
- clone espanso repo and setup shortcuts: https://espanso.org/docs/sync/
- Set Alfred open key to Option + A
- Run and login to Whatpulse
- Open RStudio and install tinytex: quarto install tinytex
- Install fonts: https://github.com/emse-eda-gwu/2021-Spring/raw/master/content/fonts.zip

# Chrome plugins

- Zotero connector
- Eye dropper
- Fonts ninja
- Speechify

# Karabiner-Elements settings

- Open Terminal
- Run: open ~/.config
- Copy-paste over the settings from this file:
https://raw.githubusercontent.com/jhelvy/jKeyboard/master/karabiner/karabiner.json

# espanso settings

1. Sync the espanso github repo
2. Quit espanso
3. Go to "Application Support" and delete the "espanso" folder there
4. Open terminal and run the following, here the first path is the path to the espanso repo.

ln -s "/Users/jhelvy/gh/espanso" "/Users/jhelvy/Library/Application Support/espanso"

# RStudio keyboard shortcuts

Insert chunk: Cmd + Shift + i
Open next tab: Cmd + 2
Open previous tab: Cmd + 1
Move focus to console: Ctrl + 0
Move focus to source: Ctrl + 9
Run current line or selection: Ctrl + Y
Block indent: Cmd + ]
Block outdent: Cmd + [
Comment / uncomment selection: Cmd +
Reflow comment: Cmd + Shift + /
Extract function: Cmd + Shift + X
Quick add next: Cmd + D

# VSCode / Cursor settings

Add this to Rprofile to attach R sessions:

usethis::edit_r_profile()

```
Sys.setenv(TERM_PROGRAM = "vscode")
source(file.path(Sys.getenv(
  if (.Platform$OS.type == "mac") "USERPROFILE" else "HOME"),
  ".vscode-R", "init.R")
)
```

Then install the following extensions:

R
Quarto

# Sublime Text 3

Old license:

----- BEGIN LICENSE -----
John Helveston
Single User License
EA7E-889474
87BDED1B AB31371D 374F00FB 37DC6743
24E22FE5 38244119 88D1B523 9A45A4E3
94D211DF E0514F50 A311184E C224CFA6
78508626 D4FC1334 A8D06148 B4978281
C0F2E220 E0C23743 E154A7DA 96F6FCEE
4716C34E DF06CD4F CB3BD4E6 07D99C36
5BB1BF36 86BDE616 6C07FA4B 71A4BC7B
2A968F47 65E9DA63 F6EE4195 5FAA3B6D
------ END LICENSE ------

New license:

----- BEGIN LICENSE -----
John Helveston
Single User License
EA7E-1285623-460314
17EC29C6 2F3C7823 B3185A76 93650689
2AC30DCC 5D497EB1 BDFA4D8F 1987F069
14639134 A2263E4F 6BBE3D6D A76CF4E1
DBF01BCB BD900CA8 E02854C8 90127C37
B35E5127 C20FDD78 B288C1A0 28881CF0
978D995E EC9220E7 EA1F1966 6978DD70
CCD88339 FD8DA6E3 C1B0EAC4 6F55F269
A23746EC B0A8CD2F 4DD18A57 E6C1A44C
------ END LICENSE ------

Check Package Control for updated instructions: https://packagecontrol.io/installation

Use Package control to load the following plugins:

- Sublime REPL
- R-Box
- LaTeX Tools
- Advanced New File
- Sidebar Enhancements
- Soda Theme: https://github.com/buymeasoda/soda-theme/
- Tomorrow color schemes https://sublime.wbond.net/packages/Tomorrow%20Color%20Schemes
- Text Wordcount
- Alignment

Copy-paste all the settings files into the user folder

# Automator to copy file paths

- Launch Automator and create a new "Quick Action"
- Use search function, look for “Copy to Clipboard” and drag into the rightside panel of the Service
- Set ‘Service recieves selected’ to “files or folders” and ‘in’ to “Finder” as shown in the screen shot below
- Save the Service with a name like “Copy Path”
