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
