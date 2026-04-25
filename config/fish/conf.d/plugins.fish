# starship
if status is-interactive; and type -q starship
    starship init fish | source
end

# Docker
test -f ~/.docker/init-fish.sh; and source ~/.docker/init-fish.sh

# rbenv
if type -q rbenv
    rbenv init - fish 2>/dev/null | source; or rbenv init - | source
end

# nodenv
if type -q nodenv
    nodenv init - fish 2>/dev/null | source; or nodenv init - | source
end

# pyenv
if type -q pyenv
    pyenv init - fish 2>/dev/null | source
end

# fzf
if type -q fzf
    fzf --version >/dev/null 2>&1; and fzf --fish | source
end
