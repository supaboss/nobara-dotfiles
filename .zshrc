# lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt appendhistory

# added by compinstall
zstyle :compinstall filename '/home/doni/.zshrc'

autoload -Uz compinit
compinit

# added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# snippet
zinit snippet https://gist.githubusercontent.com/slashedzer0/8e5e3f9bc2f5a9d169e2a71682efbcd5/raw

# essential plugins
zinit light jackharrisonsherlock/common
zinit light clarketm/zsh-completions

zinit wait lucid light-mode for \
  atinit"zicompinit; zicdreplay" \
      zdharma-continuum/fast-syntax-highlighting \
  atload"_zsh_autosuggest_start" \
      zsh-users/zsh-autosuggestions \
  blockf atpull'zinit creinstall -q .' \
      zsh-users/zsh-completions

# new plugins
# zinit light marlonrichert/zsh-autocomplete
zinit light skywind3000/z.lua
zinit light MichaelAquilina/zsh-you-should-use
zinit light 3v1n0/zsh-bash-completions-fallback

# wfxr/forgit
zinit ice wait lucid
zinit load 'wfxr/forgit'

# zdharma-continuum/history-search-multi-word
zstyle ":history-search-multi-word" page-size "11"
zinit ice wait"1" lucid
zinit load zdharma-continuum/history-search-multi-word

# sharkdp/fd
zinit ice as"command" from"gh-r" mv"fd* -> fd" pick"fd/fd"
zinit light sharkdp/fd

# sharkdp/bat
zinit ice as"command" from"gh-r" mv"bat* -> bat" pick"bat/bat"
zinit light sharkdp/bat

# misc
export PATH=$PATH:/home/doni/.spicetify
export PATH=$PATH:~/.spoof-dpi/bin
export BAT_THEME="Catppuccin-macchiato"
export BAT_STYLE="numbers"

eval $(thefuck --alias)
