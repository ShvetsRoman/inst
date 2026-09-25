#!/usr/bin/env bash

# ╭──────────────────────────────────────────────────────────────────────────────╮
# │                    STARSHIP DOCKER COMPOSE MODULE 4.0                       │
# │                                                                              │
# │  Bash + Docker CLI only                                                     │
# │                                                                              │
# │  Приклад:                                                                    │
# │                                                                              │
# │    󰡨 default 󰙨 cbm-km-ua  ↑ 4/4                                            │
# │                                                                              │
# │  або:                                                                        │
# │                                                                              │
# │    󰡨 default 󰙨 cbm-km-ua  ↑ 3/4  ⟳ 1                                     │
# │                                                                              │
# ╰──────────────────────────────────────────────────────────────────────────────╯

set -Eeuo pipefail


# ───────────────────────────────────────────────────────────────────────────────
# CONSTANTS
# ───────────────────────────────────────────────────────────────────────────────

readonly DOCKER_ICON="󰡨"
readonly COMPOSE_ICON="󰙨"

readonly RUNNING_ICON="↑"
readonly STOPPED_ICON="⟳"

readonly COMPOSE_FILES=(
    "compose.yaml"
    "compose.yml"
    "docker-compose.yaml"
    "docker-compose.yml"
)


# ───────────────────────────────────────────────────────────────────────────────
# FUNCTIONS
# ───────────────────────────────────────────────────────────────────────────────

log_error() {
    return 0
}


# ───────────────────────────────────────────────────────────────────────────────
# check_command
# ───────────────────────────────────────────────────────────────────────────────

check_command() {
    local command_name="$1"

    command -v "$command_name" >/dev/null 2>&1
}


# ───────────────────────────────────────────────────────────────────────────────
# check_docker
# ───────────────────────────────────────────────────────────────────────────────

check_docker() {
    check_command docker || return 1

    docker info >/dev/null 2>&1 || return 1

    return 0
}


# ───────────────────────────────────────────────────────────────────────────────
# check_compose
# ───────────────────────────────────────────────────────────────────────────────

check_compose() {
    docker compose version >/dev/null 2>&1
}


# ───────────────────────────────────────────────────────────────────────────────
# find_compose_file
# ───────────────────────────────────────────────────────────────────────────────
#
# Шукаємо Compose-файл:
#
#   поточний каталог
#       ↓
#   батьківський
#       ↓
#   батьківський
#       ↓
#   ...
#       ↓
#   /
#
# Перший знайдений файл використовується.
#

find_compose_file() {

    local current_dir="$PWD"
    local compose_file

    while [[ "$current_dir" != "/" ]]; do

        for compose_file in "${COMPOSE_FILES[@]}"; do

            if [[ -f "${current_dir}/${compose_file}" ]]; then
                printf '%s\n' "${current_dir}/${compose_file}"
                return 0
            fi

        done

        current_dir="${current_dir%/*}"

        [[ -n "$current_dir" ]] || current_dir="/"
    done

    return 1
}


# ───────────────────────────────────────────────────────────────────────────────
# get_docker_context
# ───────────────────────────────────────────────────────────────────────────────

get_docker_context() {

    local context

    context="$(docker context show 2>/dev/null)" || return 1

    [[ -n "$context" ]] || return 1

    printf '%s\n' "$context"
}


# ───────────────────────────────────────────────────────────────────────────────
# get_project_name
# ───────────────────────────────────────────────────────────────────────────────
#
# Docker Compose project name визначається за правилами Compose.
#
# Пріоритет:
#
#   1. -p / --project-name
#   2. COMPOSE_PROJECT_NAME
#   3. name: у Compose config
#   4. назва каталогу
#
# Оскільки ми не передаємо -p, а COMPOSE_PROJECT_NAME
# може бути заданий середовищем, спочатку перевіряємо його.
#
# Якщо його немає, використовуємо назву каталогу.
#
# Для більшості стандартних Compose-проєктів це відповідає
# project name Docker Compose.
#

get_project_name() {

    local compose_dir="$1"

    if [[ -n "${COMPOSE_PROJECT_NAME:-}" ]]; then
        printf '%s\n' "${COMPOSE_PROJECT_NAME}"
        return 0
    fi

    local project_name

    project_name="${compose_dir##*/}"

    if [[ -n "$project_name" ]]; then
        printf '%s\n' "$project_name"
        return 0
    fi

    return 1
}


# ───────────────────────────────────────────────────────────────────────────────
# get_container_ids
# ───────────────────────────────────────────────────────────────────────────────
#
# Отримуємо ВСІ контейнери поточного Compose project.
#
# -a / --all:
#   включає stopped containers.
#
# -q:
#   повертає тільки IDs.
#

get_container_ids() {

    local compose_file="$1"
    local compose_dir="$2"

    (
        cd "$compose_dir"

        docker compose \
            -f "$compose_file" \
            ps \
            --all \
            --quiet
    ) 2>/dev/null || true
}


# ───────────────────────────────────────────────────────────────────────────────
# count_lines
# ───────────────────────────────────────────────────────────────────────────────
#
# Підрахунок рядків без awk/python/jq.
#
# Використовуємо Bash read.
#

count_lines() {

    local data="$1"
    local count=0
    local line

    if [[ -z "$data" ]]; then
        printf '0\n'
        return 0
    fi

    while IFS= read -r line; do
        [[ -n "$line" ]] || continue
        ((count += 1))
    done <<< "$data"

    printf '%d\n' "$count"
}


# ───────────────────────────────────────────────────────────────────────────────
# get_running_container_ids
# ───────────────────────────────────────────────────────────────────────────────

get_running_container_ids() {

    local compose_file="$1"
    local compose_dir="$2"

    (
        cd "$compose_dir"

        docker compose \
            -f "$compose_file" \
            ps \
            --quiet \
            --status running
    ) 2>/dev/null || true
}


# ───────────────────────────────────────────────────────────────────────────────
# get_project_status
# ───────────────────────────────────────────────────────────────────────────────

get_project_status() {

    local compose_file="$1"
    local compose_dir="$2"

    local all_containers
    local running_containers

    local total
    local running
    local stopped

    all_containers="$(
        get_container_ids \
            "$compose_file" \
            "$compose_dir"
    )"

    running_containers="$(
        get_running_container_ids \
            "$compose_file" \
            "$compose_dir"
    )"

    total="$(
        count_lines "$all_containers"
    )"

    running="$(
        count_lines "$running_containers"
    )"

    stopped=$((total - running))

    if (( stopped < 0 )); then
        stopped=0
    fi

    printf '%s %s %s\n' \
        "$total" \
        "$running" \
        "$stopped"
}


# ───────────────────────────────────────────────────────────────────────────────
# build_output
# ───────────────────────────────────────────────────────────────────────────────

build_output() {

    local context="$1"
    local project_name="$2"
    local total="$3"
    local running="$4"
    local stopped="$5"

    local output

    output="${DOCKER_ICON} ${context}"
    output+=" ${COMPOSE_ICON} ${project_name}"

    # ───────────────────────────────────────────────────────────────────────────
    # Containers
    # ───────────────────────────────────────────────────────────────────────────

    output+="  ${RUNNING_ICON} ${running}/${total}"

    # ───────────────────────────────────────────────────────────────────────────
    # Stopped
    # ───────────────────────────────────────────────────────────────────────────

    if (( stopped > 0 )); then
        output+="  ${STOPPED_ICON} ${stopped}"
    fi

    printf '%s\n' "$output"
}


# ───────────────────────────────────────────────────────────────────────────────
# MAIN
# ───────────────────────────────────────────────────────────────────────────────

main() {

    # Docker installed?
    if ! check_docker; then
        return 0
    fi


    # Docker Compose available?
    if ! check_compose; then
        return 0
    fi


    # Find Compose file.
    local compose_file

    compose_file="$(
        find_compose_file || true
    )"

    if [[ -z "$compose_file" ]]; then
        return 0
    fi


    # Compose directory.
    local compose_dir

    compose_dir="${compose_file%/*}"


    # Docker context.
    local context

    context="$(
        get_docker_context || true
    )"

    if [[ -z "$context" ]]; then
        return 0
    fi


    # Project name.
    local project_name

    project_name="$(
        get_project_name "$compose_dir" || true
    )"

    if [[ -z "$project_name" ]]; then
        return 0
    fi


    # Project status.
    local total
    local running
    local stopped

    read -r total running stopped <<< "$(
        get_project_status \
            "$compose_file" \
            "$compose_dir"
    )"


    # Output.
    build_output \
        "$context" \
        "$project_name" \
        "$total" \
        "$running" \
        "$stopped"
}


# ───────────────────────────────────────────────────────────────────────────────
# RUN
# ───────────────────────────────────────────────────────────────────────────────

main "$@"
