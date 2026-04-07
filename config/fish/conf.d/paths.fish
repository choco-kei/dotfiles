# fisher for homebrew
set -p fish_function_path (brew --prefix)/share/fish/vendor_functions.d

# Path
fish_add_path -p /opt/homebrew/bin /opt/homebrew/sbin
fish_add_path -p /usr/local/opt/mysql-client/bin
fish_add_path -p /usr/local/opt/imagemagick@6/bin
fish_add_path -p /opt/homebrew/opt/openssl@3/bin
fish_add_path -p /opt/homebrew/opt/sqlite/bin
fish_add_path -p ~/go/bin

# rbenv
if command -v rbenv > /dev/null
    rbenv init - | source
end

# nodenv
if command -v nodenv > /dev/null
    nodenv init - | source
end

# pyenv
if command -v pyenv > /dev/null
    pyenv init - | source
end
