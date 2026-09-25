#!/usr/bin/env bash
#🐍

set -Eeuo pipefail

readonly VENV_ICON="🐍"
readonly PYTHON_ICON=""

readonly PYTHON_FILES=(
    "pyproject.toml"
    "requirements.txt"
    "requirements-dev.txt"
    "Pipfile"
    "Pipfile.lock"
    "poetry.lock"
    "uv.lock"
    "setup.py"
    "setup.cfg"
    "tox.ini"
)

is_python_project() {
    local current_dir="$PWD"
    local file

    while :; do
        for file in "${PYTHON_FILES[@]}"; do
            if [[ -f "${current_dir}/${file}" ]]; then
                return 0
            fi
        done

        if [[ -d "${current_dir}/.venv" ||
              -d "${current_dir}/venv" ||
              -d "${current_dir}/env" ]]; then
            return 0
        fi

        [[ "$current_dir" == "/" ]] && break

        current_dir="${current_dir%/*}"

        [[ -n "$current_dir" ]] || current_dir="/"
    done

    return 1
}

get_python_version() {
    local version

    version="$(python --version 2>/dev/null)" || return 1
    version="${version#Python }"

    [[ -n "$version" ]] || return 1

    printf '%s\n' "$version"
}

get_venv_name() {
    local venv_path="${VIRTUAL_ENV:-}"

    [[ -n "$venv_path" ]] || return 1

    printf '%s\n' "${venv_path##*/}"
}

main() {
    command -v python >/dev/null 2>&1 || return 0

    # Активний venv має пріоритет.
    if [[ -n "${VIRTUAL_ENV:-}" ]]; then
        local python_version
        local venv_name

        python_version="$(get_python_version)" || return 0
        venv_name="$(get_venv_name)" || return 0

        printf '%s(venv):%s %s Python %s\n' \
            "$VENV_ICON" \
            "$venv_name" \
            "$PYTHON_ICON" \
            "$python_version"

        return 0
    fi

    # Без venv показуємо Python тільки всередині Python-проєкту.
    is_python_project || return 0

    local python_version

    python_version="$(get_python_version)" || return 0

    printf '%s Python %s\n' \
        "$PYTHON_ICON" \
        "$python_version"
}

main "$@"
