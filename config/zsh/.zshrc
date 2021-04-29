# DEFAULT APPLICATIONS

export PAGER=less
export EDITOR=nvim
export VISUAL=nvim
export TERMINAL=kitty
export BROWSER=vivaldi

# LOCALE
export LANG=en_US.UTF-8
export LC_COLLATE=C

# APPLICATION ENVIRONMENT

# xdg
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# fzf
export FZF_DEFAULT_OPTS="
--cycle
--border
--marker=●
--pointer=❯
--layout=reverse
--bind '?:toggle-preview'
--bind 'space:toggle+down'
--bind 'ctrl-a:select-all
--bind 'ctrl-shift-a:deselect-all'
--bind 'ctrl-u:clear-query'
--bind 'ctrl-g:first'
--bind 'ctrl-shift-g:last'
--bind 'ctrl-shift-down:preview-down'
--bind 'ctrl-shift-up:preview-up'"
# <ctrl-d> to swap between filtering over files and directories
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git fzf --bind 'ctrl-d:reload(fd --type d --hidden --follow --exlude .git'"
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
export FZF_COMPLETION_OPTS=$FZF_DEFAULT_OPTS
# use fd to generate path candidates
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}
# use fd to generate directory completion list
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

# gnupg
export GPG_TTY=$(tty)
export GNUPGHOME="$XDG_DATA_HOME/gnupg"

# golang
export GOPATH="$XDG_DATA_HOME/go"

# gtk
export GTK_RC_FILES="$XDG_CONFIG_HOME/gtk-1.0/gtkrc"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"

# less
export LESS='-RF'
export LESSHISTFILE='-'
export LS_COLORS=$(vivid generate molokai)

# lf
export LF_ICONS="tw=:st=:ow=:dt=:di=:fi=:ln=:or=:ex=:\
*.styl=:*.scss=:*.html=:*.css=:*.md=:*.json=:*.js=:*.jsx=:*.rb=:\
*.php=:*.py=:*.pyc=:*.pyo=:*.pyd=:*.conf=:*.ini=:*.yml=:*.bat=:\
*.jpg=:*.jpeg=:*.bmp=:*.png=:*.gif=:*.ico=:*.svg=:*.cpp=:*.c++=:\
*.cxx=:*.cc=:*.cp=:*.c=:*.hs=:*.lhs=:*.lua=:*.java=:*.sh=:*.fish=:\
*.ml=λ:*.mli=λ:*.diff=:*.db=:*.sql=:*.dump=:*.clj=:*.cljc=:*.cljs=:\
*.edn=:*.scala=:*.go=:*.dart=:*.xul=:*.sln=:*.suo=:*.pl=:*.pm=:\
*.t=:*.rss=:*.fsscript=:*.fsx=:*.fs=:*.fsi=:*.rs=:*.rlib=:*.d=:\
*.erl=:*.hrl=:*.vim=:*.vimrc=:*.ai=:*.psd=:*.psb=:*.ts=:*.jl=:*.rc=:\
*.xml=:*.log=:*.avi=:*.mpeg=:*.mpg=:*.mkv=:*.flv=:*.mp4=:*.mp3=:\
*.flac=:*.wav=:*.ogg=:*.epub=:*.pdf=:*.7z=:*.apk=:*.bz2=:*.cab=:\
*.cpio=:*.deb=:*.gem=:*.gz=:*.gzip=:*.lha=:*.lzh=:*.lzma=:*.rar=:\
*.rpm=:*.tar=:*.tgz=:*.xz=:*.zip=:.config::.git=:.ssh=:.Trash=:\
Desktop=:Documents=:Downloads=:Pictures=:Projects=:.DS_Store=:\
.gitconfig=:.gitignore=:.bashrc=:.bashprofile=:favicon.ico=:LICENSE=:\
node_modules=:procfile=:.Xdefaults=:.Xresources=:.dmrc=:.gitconfig=:\
.profile=:.xinputrc=:ini=:config=:"

# man
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# npm
export NPM_CONFIG_TMP="$XDG_RUNTIME_DIR/npm"
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"
export NPM_CONFIG_PREFIX="$XDG_DATA_HOME/npm"

# rust
export CARGO_HOME="$XDG_DATA_HOME/cargo"

# x11
# export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority


# SHELL OPTIONS

# completions
setopt ALWAYS_TO_END
setopt LIST_ROWS_FIRST
setopt AUTO_PARAM_SLASH
setopt COMPLETE_IN_WORD
setopt NO_MENU_COMPLETE

# globbing
setopt GLOB_DOTS
setopt EXTENDED_GLOB
setopt NO_CASE_GLOB

# directories
setopt AUTOCD 
setopt AUTO_PUSHD
setopt PUSHD_SILENT
setopt PUSHD_IGNORE_DUPS

# input/output
setopt PATH_DIRS
setopt NO_FLOW_CONTROL

# job control
setopt NO_HUP
setopt NO_BG_NICE

# history
setopt HIST_VERIFY 
setopt SHARE_HISTORY 
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_NO_FUNCTIONS
setopt HIST_IGNORE_SPACE
SAVEHIST=100000
HISTSIZE=100000
HISTFILE=$XDG_DATA_HOME/zsh/zsh_history

# PATH

typeset -U PATH path FPATH fpath
path=($HOME/.local/bin $GOPATH/bin $CARGO_HOME/bin $NPM_CONFIG_PREFIX/bin $path)
fpath=($ZDOTDIR/functions $fpath)
export PATH 
autoload -Uz $fpath[1]/*

# ZSTYLE

# completion caching
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path $XDG_CACHE_HOME/zsh/zcompcache
# completion matching (case insensitive, partial-word, substring completion)
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# completion grouping
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' verbose yes
zstyle ':completion:*' group-name ''
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:expand:*'        tag-order all-expansions
zstyle ':completion:*:correct:*'       insert-unambiguous true
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:correct:*'       original true
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# Directories
export LS_COLORS="$(vivid generate molokai)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'
zstyle ':completion:*' special-dirs ..
zstyle ':completion:*' squeeze-slashes true

# History
zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes

# Environment Variables
zstyle ':completion::*:(-command-|export):*' fake-parameters ${${${_comps[(I)-value-*]#*,}%%,*}:#-*-}

# Web
zstyle ':completion:*:urls' local 'www' '/var/www/' 'public_html'

# Kill
zstyle ':completion:*:*:*:*:processes' command 'ps -u $LOGNAME -o pid,user,command -w'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;36=0=01'
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*' insert-ids single

# Man
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true
zstyle ':completion:*:man:*'      menu yes select

# Media Players
zstyle ':completion:*:*:mpg123:*' file-patterns '*.(mp3|MP3):mp3\ files *(-/):directories'
zstyle ':completion:*:*:mpg321:*' file-patterns '*.(mp3|MP3):mp3\ files *(-/):directories'
zstyle ':completion:*:*:ogg123:*' file-patterns '*.(ogg|OGG|flac):ogg\ files *(-/):directories'
zstyle ':completion:*:*:mocp:*' file-patterns '*.(wav|WAV|mp3|MP3|ogg|OGG|flac):ogg\ files *(-/):directories'

# SSH/SCP/RSYNC
zstyle ':completion:*:(ssh|scp|rsync):*' tag-order 'hosts:-host:host hosts:-domain:domain hosts:-ipaddr:ip\ address *'
zstyle ':completion:*:(scp|rsync):*' group-order users files all-files hosts-domain hosts-host hosts-ipaddr
zstyle ':completion:*:ssh:*' group-order users hosts-domain hosts-host users hosts-ipaddr
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-host' ignored-patterns '*(.|:)*' loopback ip6-loopback localhost ip6-localhost broadcasthost
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-domain' ignored-patterns '<->.<->.<->.<->' '^[-[:alnum:]]##(.[-[:alnum:]]##)##' '*@*'
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-ipaddr' ignored-patterns '^(<->.<->.<->.<->|(|::)([[:xdigit:].]##:(#c,2))##(|%*))' '127.0.0.<->' '255.255.255.255' '::1' 'fe80::*'

# Ignore multiple entries.
zstyle ':completion:*:(rm|kill|diff):*' ignore-line other
zstyle ':completion:*:rm:*' file-patterns '*:all-files'

# Ignore unavailable commands.
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'

# ignore uninteresting user accounts
zstyle ':completion:*:*:*:users' ignored-patterns \
    adm apache avahi avahi-autoipd backup bind bin cl-builder colord couchdb daemon dictd festival \
    games gdm gnats haldaemon halt hplip ident identd irc jetty junkbust kernoops libuuid lightdm \
    list lp mail mailnull man messagebus named news nfsnobody nobody nscd ntp operator pcap postfix \
    postgres proxy pulse radvd rpc rpcuser rpm rtkit saned shutdown speech-dispatcher squid sshd \
    statd stunnel4 sync sys syslog uucp usbmux vcsa vde2-net www-data xfs

# ignore uninteresting hosts
zstyle ':completion:*:*:*:hosts' ignored-patterns \
    localhost loopback ip6-localhost ip6-loopback localhost6 localhost6.localdomain6 localhost.localdomain

# show ignored completion if perfect match
zstyle '*' single-ignored show

# Search path for sudo completion
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin \
/usr/local/bin  \
/usr/sbin       \
/usr/bin        \
/sbin           \
/bin            \
/usr/X11R6/bin


# KEYBINDS

for zle in 'surround' 'select-'{bracketed,quoted} {up,down}'-line-or-beginning-search'; do
    autoload -U $zle
done

function _user-zle-noop {  ; }
local _zle_widgets=(
    'down-line-or-beginning-search'
    'select-bracketed'
    'select-quoted'
    'up-line-or-beginning-search'
    '_user-zle-noop'
)

for zle in $_zle_widgets; do
    zle -N $zle
done

for zle in add change delete; do
    zle -N "$zle-surround" 'surround'
done

WORDCHARS='.-/'

bindkey -v 

zmodload zsh/terminfo
typeset -gA key_map
key_map=(
  'Up'              "$terminfo[kcuu1]"
  'Down'            "$terminfo[kcud1]"
  'Left'            "$terminfo[kcub1]"
  'Right'           "$terminfo[kcuf1]"
  'Home'            "$terminfo[khome]"
  'End'             "$terminfo[kend]"
  'PageUp'          "$terminfo[kpp]"
  'PageDown'        "$terminfo[knp]"
  'BackTab'         "$terminfo[kcbt]"
  'Insert'          "$terminfo[kich1]"
  'F1'              "$terminfo[kf1]"
  'F2'              "$terminfo[kf2]"
  'F3'              "$terminfo[kf3]"
  'F4'              "$terminfo[kf4]"
  'F5'              "$terminfo[kf5]"
  'F6'              "$terminfo[kf6]"
  'F7'              "$terminfo[kf7]"
  'F8'              "$terminfo[kf8]"
  'F9'              "$terminfo[kf9]"
  'F10'             "$terminfo[kf10]"
  'F11'             "$terminfo[kf11]"
  'F12'             "$terminfo[kf12]"
  'Control'         "\C-"
  'ControlLeft'     "\e[1;5D \e[5D \e\e[D \eOd"
  'ControlRight'    "\e[1;5C \e[5C \e\e[C \eOc"
  'ControlPageUp'   "\e[5;5~"
  'ControlPageDown' "\e[6;5~"
  'Meta'            "\M-"
  'Escape'          "\e"
  'Delete'          "^[[3~"
  'Backspace'       "^?"
)

# Set empty $keyamp values to invalid UTF-8 sequence to incude silent failure if used
for key in "${(k)key_map[@]}"; do
    if [[ -z $key_map[$key] ]]; then
        key_map[$key]='� '
    fi
done

for map in emacs viins vicmd; do
    bindkey -M $map $key_map[Delete] delete-char
    bindkey -M $map $key_map[Home] beginning-of-line
    bindkey -M $map $key_map[End] end-of-line
    bindkey -M $map $key_map[PageUp] beginning-of-buffer-or-history
    bindkey -M $map $key_map[PageDown] end-of-buffer-or-history
    bindkey -M $map $key_map[Up] up-line-or-beginning-search
    bindkey -M $map $key_map[Down] down-line-or-beginning-search
done

for map in emacs viins; do
    bindkey -M $map $key_map[Left] backward-char
    bindkey -M $map $key_map[Right] forward-char
    bindkey -M $map $key_map[Insert] overwrite-mode
    bindkey -M $map $key_map[BackTab] reverse-menu-complete
    bindkey -M $map $key_map[Backspace] backward-delete-char
    bindkey -M $map $key_map[Control]L clear-screen
    bindkey -M $map $key_map[Control]E forward-word
    bindkey -M $map $key_map[Control]A backward-word
    bindkey -M $map $key_map[Control]I expand-or-complete
done

for map in viins vicmd; do
    for key in "${(s: :)key_map[ControlLeft]}"
        bindkey -M $map $key vi-backward-word
    for key in "${(s: :)key_map[ControlRight]}"
        bindkey -M $map $key vi-forward-word
    for key in F{1..12}
        bindkey -M $map $key_map[$key] _user-zle-noop
done
unfunction _user-zle-noop

for map in visual viopp; do
    for key in {a,i}${(s..)^:-'()[]{}<>bB'}; do
        bindkey -M $map $key select-bracketed
    done
    for key in {a,i}{\',\",\`}; do
        bindkey -M $map $key select-quoted
    done
done

bindkey -M vicmd 'u' undo
bindkey -M vicmd $key[Control]R redo
bindkey -M vicmd "?" history-incremental-pattern-search-backward
bindkey -M vicmd "/" history-incremental-pattern-search-forward
bindkey -M vicmd 'cs' change-surround
bindkey -M vicmd 'ds' delete-surround
bindkey -M vicmd 'ys' add-surround
bindkey -M visual 'S' add-surround


zmodload zsh/complist
bindkey -M menuselect $key[Control]I menu-complete
bindkey -M menuselect $key[Control]Z reverse-menu-complete
bindkey -M menuselect $key_info[Control]U undo
bindkey -M viins "$key_info[Control]U" undo

if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
    autoload -Uz add-zle-hook-widget 
    function zle_application_mode_start { echoti smkx }
    function zle_application_mode_stop { echoti rmkx }
    add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
    add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

alias -g B="| bat"
alias -g R="| rg"
alias -g F="| fzf"
alias -g T="| tail"
alias -g L="| less"

alias ls='exa'
alias cat='bat'
alias vim='nvim'
alias mkdir='mkdir -p'

# systemd
alias jc="journalctl"
alias sc="systemctl"
alias scu="systemctl --user"

# dotfiles
alias zrc="nvim ${ZDOTDIR:-$HOME}/.zshrc"
alias trc="nvim $XDG_CONFIG_HOME/tmux/tmux.conf"
alias vrc="nvim $XDG_CONFIG_HOME/nvim/init.vim"
alias krc="nvim $XDG_CONFIG_HOME/kitty/kitty.conf"
alias arc="nvim $XDG_CONFIG_HOME/alacritty/alacritty.yml"
alias crc="nvim $XDG_CONFIG_HOME/picom/picom.conf"
alias rrc="nvim $XDG_CONFIG_HOME/rofi/config.rasi"
alias lrc="nvim $XDG_CONFIG_HOME/lf/lfrc"
alias prc="nvim $XDG_CONFIG_HOME/polybar/config"
alias xrc="nvim $XDG_CONFIG_HOME/X11/xinitrc"

fpath=(
    $ZDOTDIR/functions
    $ZDOTDIR/plugins/zsh-completions/src
    $fpath
) 
autoload -U $fpath[1]/*

autoload -Uz compinit
compinit -C -d $XDG_CACHE_HOME/zsh/zcompdump

eval $(starship init zsh)

source $ZDOTDIR/plugins/lf-icons.zsh
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh
kitty + complete setup zsh | source /dev/stdin

ZSH_AUTOSUGGEST_USE_ASYNC=1
ZSH_AUTOSUGGEST_MANUAL_REBIND=1
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source $ZDOTDIR/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
