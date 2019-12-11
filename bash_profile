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

export HISTFILESIZE=1000000000000

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# . /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc
# . /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc

[ -f ~/.fzf.bash ] && . ~/.fzf.bash

kubectl --help > /dev/null && . <(kubectl completion bash) # setup autocomplete in bash into the current shell, bash-completion package should be installed first.
