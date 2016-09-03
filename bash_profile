. "${HOME}/.secret_keys"
. "${HOME}/.env_vars"
. "${HOME}/.aliases"

eval $(lesspipe.sh)

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

if [ -f `brew --prefix`/etc/bash_completion.d/vagrant ]; then
    source `brew --prefix`/etc/bash_completion.d/vagrant
fi

eval "$(direnv hook bash)"

export HISTFILESIZE=10000000000

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"