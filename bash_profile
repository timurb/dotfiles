. "${HOME}/.secret_keys"
. "${HOME}/.env_vars"
. "${HOME}/.aliases"

eval $(lesspipe.sh)

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi
