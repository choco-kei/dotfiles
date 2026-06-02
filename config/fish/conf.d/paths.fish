# homebrew
if test -d /opt/homebrew
    set -l BREW_PREFIX /opt/homebrew
else if test -d /usr/local/Homebrew
    set -l BREW_PREFIX /usr/local
else if type -q brew
    set -l BREW_PREFIX (brew --prefix)
end

# Path: only add if directory exists (prepend intent kept with -p)
test -d ~/dotfiles/bin; and fish_add_path -p ~/dotfiles/bin

for p in \
    /opt/homebrew/bin \
    /opt/homebrew/sbin \
    /usr/local/opt/mysql-client/bin \
    /usr/local/opt/imagemagick@6/bin \
    /opt/homebrew/opt/openssl@3/bin \
    /opt/homebrew/opt/sqlite/bin \
    /usr/local/opt/go/libexec/bin \
    ~/go/bin
    test -d $p; and fish_add_path -p $p
end
