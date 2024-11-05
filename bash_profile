echo "Loading secrets"
. "${HOME}/.secret_keys"

echo "Loading env vars"
. "${HOME}/.env_vars"

echo "Loading aliases"
. "${HOME}/.aliases"

echo "Loading bash completion"
. "${HOME}/.bash_completion"

echo "Loading bash integrations"
. "${HOME}/.bash_integrations"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/${HOME}/.sdkman"
[[ -s "/Users/${HOME}/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/${HOME}/.sdkman/bin/sdkman-init.sh"
