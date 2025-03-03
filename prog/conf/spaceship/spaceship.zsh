# Показувати час
SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_COLOR=gray

# Завжди показувати ім'я користувача
# SPACESHIP_USER_SHOW=always

SPACESHIP_DIR_TRUNC=12

SPACESHIP_DIR_TRUNC_REPO=false

SPACESHIP_ASYNC_SHOW=false
# SPACESHIP_ASYNC_SYMBOL=""

spaceship remove user
spaceship remove venv
spaceship remove time
SPACESHIP_RPROMPT_ORDER=(
user
venv
time
)
