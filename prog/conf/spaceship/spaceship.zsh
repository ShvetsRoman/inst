# Показувати кількість вкладень директорії
SPACESHIP_DIR_TRUNC=10
SPACESHIP_DIR_TRUNC_REPO=false

# Асинхроне завантаження
# SPACESHIP_ASYNC_SHOW=false
SPACESHIP_ASYNC_SYMBOL=""

# Показувати час
SPACESHIP_TIME_SHOW=true
# Колір часу
SPACESHIP_TIME_COLOR=gray

# Завжди показувати ім'я користувача
SPACESHIP_USER_SHOW=always

# Не скорочувати шлях в репозиторіях
SPACESHIP_DIR_TRUNC_REPO=false

# Відключення відображення з лівої сторони
# spaceship remove user
spaceship remove venv
spaceship remove time

# Відображення з лівої сторони
SPACESHIP_PROMPT_ORDER=(
  user           # Username section
  dir            # Current directory section
  host           # Hostname section
  git            # Git section (git_branch + git_status)
  hg             # Mercurial section (hg_branch  + hg_status)
  package        # Package version
  node           # Node.js section
  bun            # Bun section
  deno           # Deno section
  ruby           # Ruby section
  python         # Python section
  elm            # Elm section
  elixir         # Elixir section
  xcode          # Xcode section
  swift          # Swift section
  golang         # Go section
  perl           # Perl section
  php            # PHP section
  rust           # Rust section
  haskell        # Haskell Stack section
  scala          # Scala section
  kotlin         # Kotlin section
  java           # Java section
  lua            # Lua section
  dart           # Dart section
  julia          # Julia section
  crystal        # Crystal section
  docker         # Docker section
  docker_compose # Docker section
  aws            # Amazon Web Services section
  gcloud         # Google Cloud Platform section
  azure          # Azure section
  venv           # virtualenv section
  conda          # conda virtualenv section
  dotnet         # .NET section
  ocaml          # OCaml section
  vlang          # V section
  zig            # Zig section
  purescript     # PureScript section
  erlang         # Erlang section
  kubectl        # Kubectl context section
  ansible        # Ansible section
  terraform      # Terraform workspace section
  pulumi         # Pulumi stack section
  ibmcloud       # IBM Cloud section
  nix_shell      # Nix shell
  gnu_screen     # GNU Screen section
  exec_time      # Execution time
  async          # Async jobs indicator
  line_sep       # Line break
  battery        # Battery level and status
  jobs           # Background jobs indicator
  exit_code      # Exit code section
  sudo           # Sudo indicator
  char           # Prompt character
)

# Відображення з правої сторони
SPACESHIP_RPROMPT_ORDER=(
# venv
# user
time
)

# SPACESHIP_USER_PREFIX=""
# SPACESHIP_USER_SUFFIX=""
SPACESHIP_GIT_PREFIX=""
SPACESHIP_DIR_PREFIX=""
SPACESHIP_VENV_PREFIX=""
# SPACESHIP_TIME_PREFIX=""
# SPACESHIP_RPROMPT_FIRST_PREFIX_SHOW=false
