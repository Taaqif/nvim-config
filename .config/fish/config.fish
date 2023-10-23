set fish_greeting # disable fish greeting
set -Ux EDITOR nvim
set -Ux TERM xterm-256color
set -Ux NEOVIM_WIN_DIR "/mnt/c/Program Files/Neovim"
fish_add_path /home/tye/.cargo/bin
fish_add_path /home/tye/.local/share/bob/nvim-bin
fish_add_path /mnt/c/Program\ Files/WezTerm
if status is-interactive
    # Commands to run in interactive sessions can go here
    zoxide init fish | source
end

set -Ux LS_COLORS "di=34:ln=35:so=32:pi=33:ex=37:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
alias lg='lazygit'

test -s /home/tye/.nvm/nvm.fish; and source /home/tye/.nvm/nvm.fish
set --universal nvm_default_version v18

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# pnpm
set -gx PNPM_HOME "/home/tye/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
