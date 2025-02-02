#  ┏┳┓┓     ┏┓      ┏┓ ┓    
#   ┃ ┣┓┏┓  ┏┛┏┓┏┓  ┏┛┏┣┓┏┓┏
#   ┻ ┛┗┗   ┗┛┗ ┛┗  ┗┛┛┛┗┛ ┗
#                           

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


#╔═╗┌─┐┬ ┬┬─┐┌─┐┬┌┐┌┌─┐  ┌┬┐┬ ┬┌─┐  ┌─┐┬┌┐┌┬┌┬┐  ┌─┐┬  ┬ ┬┌─┐┬┌┐┌
#╚═╗│ ││ │├┬┘│  │││││ ┬   │ ├─┤├┤   ┌─┘│││││ │   ├─┘│  │ ││ ┬││││
#╚═╝└─┘└─┘┴└─└─┘┴┘└┘└─┘   ┴ ┴ ┴└─┘  └─┘┴┘└┘┴ ┴   ┴  ┴─┘└─┘└─┘┴┘└┘
source "${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git/zinit.zsh"

#╔═╗┌─┐┌┐┌  ┌─┐┬ ┬┌┬┐┌─┐  ┌─┐┬─┐┌─┐┌┬┐┌─┐┌┬┐
#╔═╝├┤ │││  └─┐│ │ │││ │  ├─┘├┬┘│ ││││├─┘ │ 
#╚═╝└─┘┘└┘  └─┘└─┘─┴┘└─┘  ┴  ┴└─└─┘┴ ┴┴   ┴ 
export SUDO_PROMPT="$fg[red][sudo] $fg[yellow]password for $USER  :$fg[white]"

#  ╔═╗┬  ┬ ┬┌─┐┬┌┐┌┌─┐
#  ╠═╝│  │ ││ ┬││││└─┐
#  ╩  ┴─┘└─┘└─┘┴┘└┘└─┘
zinit ice depth"1"
zinit ice as"command" from"gh-r" \
          atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh"
zinit light starship/starship
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

#  ╔═╗┌┐┌┬┌─┐┌─┐┌─┐┌┬┐┌─┐
#  ╚═╗││││├─┘├─┘├┤  │ └─┐
#  ╚═╝┘└┘┴┴  ┴  └─┘ ┴ └─┘
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found

#  ╔═╗┌─┐┌┬┐┌─┐┬  ┌─┐┌┬┐┬┌─┐┌┐┌   ┬   ╦  ┌─┐┌─┐┌┬┐┬┌┐┌┌─┐  ╔═╗┌┐┌┌─┐┬┌┐┌┌─┐
#  ║  │ ││││├─┘│  ├┤  │ ││ ││││  ┌┼─  ║  │ │├─┤ │││││││ ┬  ║╣ ││││ ┬││││├┤ 
#  ╚═╝└─┘┴ ┴┴  ┴─┘└─┘ ┴ ┴└─┘┘└┘  └┘   ╩═╝└─┘┴ ┴─┴┘┴┘└┘└─┘  ╚═╝┘└┘└─┘┴┘└┘└─┘
autoload -Uz compinit 

for dump in ~/.config/zsh/zcompdump(N.mh+24); do
  compinit -d ~/.config/zsh/zcompdump
done

compinit -C -d ~/.config/zsh/zcompdump
_comp_options+=(globdots)

#  ╔═╗┌─┐┌┬┐┌─┐┬  ┌─┐┌┬┐┬┌─┐┌┐┌┌─┐  ╔═╗┌┬┐┬ ┬┬  ┌─┐
#  ║  │ ││││├─┘│  ├┤  │ ││ ││││└─┐  ╚═╗ │ └┬┘│  ├┤ 
#  ╚═╝└─┘┴ ┴┴  ┴─┘└─┘ ┴ ┴└─┘┘└┘└─┘  ╚═╝ ┴  ┴ ┴─┘└─┘
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list \
		'm:{a-zA-Z}={A-Za-z}' \
		'+r:|[._-]=* r:|=*' \
		'+l:|=*'
zstyle ':completion:*:warnings' format "%B%F{red}No matches for:%f %F{magenta}%d%b"
zstyle ':completion:*:descriptions' format '%F{yellow}[-- %d --]%f'

#  ╔═╗┬ ┬┌┬┐┌─┐  ┌─┐┬ ┬┌─┐┌─┐┌─┐┌─┐┌┬┐┬┌─┐┌┐┌  ┌─┐┌─┐┌┬┐┌┬┐┬┌┐┌┌─┐┌─┐
#  ╠═╣│ │ │ │ │  └─┐│ ││ ┬│ ┬├┤ └─┐ │ ││ ││││  └─┐├┤  │  │ │││││ ┬└─┐
#  ╩ ╩└─┘ ┴ └─┘  └─┘└─┘└─┘└─┘└─┘└─┘ ┴ ┴└─┘┘└┘  └─┘└─┘ ┴  ┴ ┴┘└┘└─┘└─┘
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

#  ╦ ╦┌─┐┬┌┬┐┬┌┐┌┌─┐  ╔╦╗┌─┐┌┬┐┌─┐
#  ║║║├─┤│ │ │││││ ┬   ║║│ │ │ └─┐
#  ╚╩╝┴ ┴┴ ┴ ┴┘└┘└─┘  ═╩╝└─┘ ┴ └─┘
expand-or-complete-with-dots() {
  echo -n "\e[31m…\e[0m"
  zle expand-or-complete
  zle redisplay
}

zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots

#  ╦ ╦┬┌─┐┌┬┐┌─┐┬─┐┬ ┬
#  ╠═╣│└─┐ │ │ │├┬┘└┬┘
#  ╩ ╩┴└─┘ ┴ └─┘┴└─ ┴ 
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history"
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

#  ╔═╗┌─┐┌┬┐┬┌─┐┌┐┌┌─┐
#  ║ ║├─┘ │ ││ ││││└─┐
#  ╚═╝┴   ┴ ┴└─┘┘└┘└─┘
stty stop undef		    # Disable ctrl-s to freeze terminal.
setopt interactive_comments
setopt AUTOCD               # change directory just by typing its name
setopt MENU_COMPLETE        # Automatically highlight first element of completion menu
setopt LIST_PACKED	    # The completion menu takes less space.
setopt AUTO_LIST            # Automatically list choices on ambiguous completion.
setopt COMPLETE_IN_WORD     # Complete from both ends of a word.


#  ╦  ╦┬┌┬┐┌┐ ┬┌┐┌┌┬┐
#  ╚╗╔╝││││├┴┐││││ ││
#   ╚╝ ┴┴ ┴└─┘┴┘└┘─┴┘
bindkey -v
export KEYTIMEOUT=1

bindkey '^j' history-search-backward
bindkey '^k' history-search-forward
bindkey '^[w' kill-region
bindkey '^y' autosuggest-accept
bindkey -v '^?' backward-delete-char

#Cursor Shapes For Different Vim Mode
#Cursor style cheat sheet
# Set cursor style (DECSCUSR), VT520.
# 0  ⇒  blinking block.
# 1  ⇒  blinking block (default).
# 2  ⇒  steady block.
# 3  ⇒  blinking underline.
# 4  ⇒  steady underline.
# 5  ⇒  blinking bar, xterm.
# 6  ⇒  steady bar, xterm.

function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;  #block
        viins|main) echo -ne '\e[5 q';; #beam
    esac
}
zle -N zle-keymap-select
zle-line-init(){
    zle -K viins # initiate vi insert as keymap (can be removed if 'bindkey -v' has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use blinking bar shape cursor on startup
preexec() { echo -ne '\e[5 q' ;} # USE blinking bar shape cursor for each new prompt

#  ╔═╗┬ ┬┌─┐┌┬┐┌─┐┌┬┐  ╔═╗┬ ┬┌┐┌┌─┐┌┬┐┬┌─┐┌┐┌┌─┐   ┬   ╦╔═┌─┐┬ ┬┌┐ ┬┌┐┌┌┬┐┌─┐
#  ║  │ │└─┐ │ │ ││││  ╠╣ │ │││││   │ ││ ││││└─┐  ┌┼─  ╠╩╗├┤ └┬┘├┴┐││││ ││└─┐
#  ╚═╝└─┘└─┘ ┴ └─┘┴ ┴  ╚  └─┘┘└┘└─┘ ┴ ┴└─┘┘└┘└─┘  └┘   ╩ ╩└─┘ ┴ └─┘┴┘└┘─┴┘└─┘
function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
bindkey -s '^o' '^uyy\n'
bindkey -s '^f' '^utmux-sessionizer'
bindkey -M vicmd "^[[3~" delete-char
bindkey "^[[3~"  delete-char

#  ╔═╗┬  ┬┌─┐┌─┐┌─┐┌─┐
#  ╠═╣│  │├─┤└─┐├┤ └─┐
#  ╩ ╩┴─┘┴┴ ┴└─┘└─┘└─┘
alias cat="bat --theme=base16"
alias ls='eza --icons=always --color=always -a'
alias ll='eza --icons=always --color=always -la' 
alias vim='nvim'
alias c='clear'
alias stu='xrdb $HOME/.config/x11/xresources && pidof st | xargs kill -s USR1'

#  ╔═╗┬ ┬┌─┐┬  ┬    ╦┌┐┌┌┬┐┌─┐┌─┐┬─┐┌─┐┌┬┐┬┌─┐┌┐┌
#  ╚═╗├─┤├┤ │  │    ║│││ │ ├┤ │ ┬├┬┘├─┤ │ ││ ││││
#  ╚═╝┴ ┴└─┘┴─┘┴─┘  ╩┘└┘ ┴ └─┘└─┘┴└─┴ ┴ ┴ ┴└─┘┘└┘
eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"
source <(fzf --zsh)
#  ┏┳┓┓     ┏┓      ┏┓ ┓    
#   ┃ ┣┓┏┓  ┏┛┏┓┏┓  ┏┛┏┣┓┏┓┏
#   ┻ ┛┗┗   ┗┛┗ ┛┗  ┗┛┛┛┗┛ ┗
#                           

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


#╔═╗┌─┐┬ ┬┬─┐┌─┐┬┌┐┌┌─┐  ┌┬┐┬ ┬┌─┐  ┌─┐┬┌┐┌┬┌┬┐  ┌─┐┬  ┬ ┬┌─┐┬┌┐┌
#╚═╗│ ││ │├┬┘│  │││││ ┬   │ ├─┤├┤   ┌─┘│││││ │   ├─┘│  │ ││ ┬││││
#╚═╝└─┘└─┘┴└─└─┘┴┘└┘└─┘   ┴ ┴ ┴└─┘  └─┘┴┘└┘┴ ┴   ┴  ┴─┘└─┘└─┘┴┘└┘
source "${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git/zinit.zsh"

#╔═╗┌─┐┌┐┌  ┌─┐┬ ┬┌┬┐┌─┐  ┌─┐┬─┐┌─┐┌┬┐┌─┐┌┬┐
#╔═╝├┤ │││  └─┐│ │ │││ │  ├─┘├┬┘│ ││││├─┘ │ 
#╚═╝└─┘┘└┘  └─┘└─┘─┴┘└─┘  ┴  ┴└─└─┘┴ ┴┴   ┴ 
export SUDO_PROMPT="$fg[red][sudo] $fg[yellow]password for $USER  :$fg[white]"

#  ╔═╗┬  ┬ ┬┌─┐┬┌┐┌┌─┐
#  ╠═╝│  │ ││ ┬││││└─┐
#  ╩  ┴─┘└─┘└─┘┴┘└┘└─┘
zinit ice depth"1"
zinit ice as"command" from"gh-r" \
          atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh"
zinit light starship/starship
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

#  ╔═╗┌┐┌┬┌─┐┌─┐┌─┐┌┬┐┌─┐
#  ╚═╗││││├─┘├─┘├┤  │ └─┐
#  ╚═╝┘└┘┴┴  ┴  └─┘ ┴ └─┘
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found

#  ╔═╗┌─┐┌┬┐┌─┐┬  ┌─┐┌┬┐┬┌─┐┌┐┌   ┬   ╦  ┌─┐┌─┐┌┬┐┬┌┐┌┌─┐  ╔═╗┌┐┌┌─┐┬┌┐┌┌─┐
#  ║  │ ││││├─┘│  ├┤  │ ││ ││││  ┌┼─  ║  │ │├─┤ │││││││ ┬  ║╣ ││││ ┬││││├┤ 
#  ╚═╝└─┘┴ ┴┴  ┴─┘└─┘ ┴ ┴└─┘┘└┘  └┘   ╩═╝└─┘┴ ┴─┴┘┴┘└┘└─┘  ╚═╝┘└┘└─┘┴┘└┘└─┘
autoload -Uz compinit 

for dump in ~/.config/zsh/zcompdump(N.mh+24); do
  compinit -d ~/.config/zsh/zcompdump
done

compinit -C -d ~/.config/zsh/zcompdump
_comp_options+=(globdots)

#  ╔═╗┌─┐┌┬┐┌─┐┬  ┌─┐┌┬┐┬┌─┐┌┐┌┌─┐  ╔═╗┌┬┐┬ ┬┬  ┌─┐
#  ║  │ ││││├─┘│  ├┤  │ ││ ││││└─┐  ╚═╗ │ └┬┘│  ├┤ 
#  ╚═╝└─┘┴ ┴┴  ┴─┘└─┘ ┴ ┴└─┘┘└┘└─┘  ╚═╝ ┴  ┴ ┴─┘└─┘
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list \
		'm:{a-zA-Z}={A-Za-z}' \
		'+r:|[._-]=* r:|=*' \
		'+l:|=*'
zstyle ':completion:*:warnings' format "%B%F{red}No matches for:%f %F{magenta}%d%b"
zstyle ':completion:*:descriptions' format '%F{yellow}[-- %d --]%f'

#  ╔═╗┬ ┬┌┬┐┌─┐  ┌─┐┬ ┬┌─┐┌─┐┌─┐┌─┐┌┬┐┬┌─┐┌┐┌  ┌─┐┌─┐┌┬┐┌┬┐┬┌┐┌┌─┐┌─┐
#  ╠═╣│ │ │ │ │  └─┐│ ││ ┬│ ┬├┤ └─┐ │ ││ ││││  └─┐├┤  │  │ │││││ ┬└─┐
#  ╩ ╩└─┘ ┴ └─┘  └─┘└─┘└─┘└─┘└─┘└─┘ ┴ ┴└─┘┘└┘  └─┘└─┘ ┴  ┴ ┴┘└┘└─┘└─┘
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

#  ╦ ╦┌─┐┬┌┬┐┬┌┐┌┌─┐  ╔╦╗┌─┐┌┬┐┌─┐
#  ║║║├─┤│ │ │││││ ┬   ║║│ │ │ └─┐
#  ╚╩╝┴ ┴┴ ┴ ┴┘└┘└─┘  ═╩╝└─┘ ┴ └─┘
expand-or-complete-with-dots() {
  echo -n "\e[31m…\e[0m"
  zle expand-or-complete
  zle redisplay
}

zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots

#  ╦ ╦┬┌─┐┌┬┐┌─┐┬─┐┬ ┬
#  ╠═╣│└─┐ │ │ │├┬┘└┬┘
#  ╩ ╩┴└─┘ ┴ └─┘┴└─ ┴ 
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history"
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

#  ╔═╗┌─┐┌┬┐┬┌─┐┌┐┌┌─┐
#  ║ ║├─┘ │ ││ ││││└─┐
#  ╚═╝┴   ┴ ┴└─┘┘└┘└─┘
stty stop undef		    # Disable ctrl-s to freeze terminal.
setopt interactive_comments
setopt AUTOCD               # change directory just by typing its name
setopt MENU_COMPLETE        # Automatically highlight first element of completion menu
setopt LIST_PACKED	    # The completion menu takes less space.
setopt AUTO_LIST            # Automatically list choices on ambiguous completion.
setopt COMPLETE_IN_WORD     # Complete from both ends of a word.


#  ╦  ╦┬┌┬┐┌┐ ┬┌┐┌┌┬┐
#  ╚╗╔╝││││├┴┐││││ ││
#   ╚╝ ┴┴ ┴└─┘┴┘└┘─┴┘
bindkey -v
export KEYTIMEOUT=1

bindkey '^j' history-search-backward
bindkey '^k' history-search-forward
bindkey '^[w' kill-region
bindkey '^y' autosuggest-accept
bindkey -v '^?' backward-delete-char

#Cursor Shapes For Different Vim Mode
#Cursor style cheat sheet
# Set cursor style (DECSCUSR), VT520.
# 0  ⇒  blinking block.
# 1  ⇒  blinking block (default).
# 2  ⇒  steady block.
# 3  ⇒  blinking underline.
# 4  ⇒  steady underline.
# 5  ⇒  blinking bar, xterm.
# 6  ⇒  steady bar, xterm.

function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;  #block
        viins|main) echo -ne '\e[5 q';; #beam
    esac
}
zle -N zle-keymap-select
zle-line-init(){
    zle -K viins # initiate vi insert as keymap (can be removed if 'bindkey -v' has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use blinking bar shape cursor on startup
preexec() { echo -ne '\e[5 q' ;} # USE blinking bar shape cursor for each new prompt

#  ╔═╗┬ ┬┌─┐┌┬┐┌─┐┌┬┐  ╔═╗┬ ┬┌┐┌┌─┐┌┬┐┬┌─┐┌┐┌┌─┐   ┬   ╦╔═┌─┐┬ ┬┌┐ ┬┌┐┌┌┬┐┌─┐
#  ║  │ │└─┐ │ │ ││││  ╠╣ │ │││││   │ ││ ││││└─┐  ┌┼─  ╠╩╗├┤ └┬┘├┴┐││││ ││└─┐
#  ╚═╝└─┘└─┘ ┴ └─┘┴ ┴  ╚  └─┘┘└┘└─┘ ┴ ┴└─┘┘└┘└─┘  └┘   ╩ ╩└─┘ ┴ └─┘┴┘└┘─┴┘└─┘
function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
bindkey -s '^o' '^uyy\n'
bindkey -s '^f' '^utmux-sessionizer'
bindkey -M vicmd "^[[3~" delete-char
bindkey "^[[3~"  delete-char

#  ╔═╗┬  ┬┌─┐┌─┐┌─┐┌─┐
#  ╠═╣│  │├─┤└─┐├┤ └─┐
#  ╩ ╩┴─┘┴┴ ┴└─┘└─┘└─┘
alias cat="bat --theme=base16"
alias ls='eza --icons=always --color=always -a'
alias ll='eza --icons=always --color=always -la' 
alias vim='nvim'
alias c='clear'
alias stu='xrdb $HOME/.config/x11/xresources && pidof st | xargs kill -s USR1'



#  ╔═╗┬ ┬┌┬┐┌─┐┌─┐┌┬┐┌─┐┬─┐┌┬┐
#  ╠═╣│ │ │ │ │└─┐ │ ├─┤├┬┘ │ 
#  ╩ ╩└─┘ ┴ └─┘└─┘ ┴ ┴ ┴┴└─ ┴ 
fastfetch-randomizer.sh


#  ╔═╗┬ ┬┌─┐┬  ┬    ╦┌┐┌┌┬┐┌─┐┌─┐┬─┐┌─┐┌┬┐┬┌─┐┌┐┌
#  ╚═╗├─┤├┤ │  │    ║│││ │ ├┤ │ ┬├┬┘├─┤ │ ││ ││││
#  ╚═╝┴ ┴└─┘┴─┘┴─┘  ╩┘└┘ ┴ └─┘└─┘┴└─┴ ┴ ┴ ┴└─┘┘└┘
eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"
source <(fzf --zsh)
export PATH=$PATH:/home/zeus/.spicetify

