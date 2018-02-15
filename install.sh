#!/usr/bin/env bash


app_name='t-macs'
[ -z "$APP_PATH" ] && APP_PATH="$HOME/.emacs.d"
[ -z "$REPO_URI" ] && REPO_URI='https://github.com/tracyone/t-macs.git'
[ -z "$REPO_BRANCH" ] && REPO_BRANCH='master'
debug_mode='0'

########## Basic setup tools
msg() {
    printf '%b\n' "$1" >&2
}

success() {
    if [ "$ret" -eq '0' ];
    then
        msg "\33[32m[✔]\33[0m ${1}${2}"
    fi
}

error() {
    msg "\33[31m[✘]\33[0m ${1}${2}"
    exit 1
}

debug() {
    if [ "$debug_mode" -eq '1' ] && [ "$ret" -gt '1' ];
    then
        msg "An error occurred in function \"${FUNCNAME[$i+1]}\" on line ${BASH_LINENO[$i+1]}, we're sorry for that."
    fi
}

exists() {
    command -v "$1" >/dev/null 2>&1
}

program_exists() {
    local ret='0'
    exists "$1" || { local ret='1'; }

    # fail on non-zero return value
    if [ "$ret" -ne 0 ];
    then
        return 1
    fi

    return 0
}

program_must_exist() {

    # throw error on non-zero return value
    if ! program_exists "$1";
    then
        error "You must have '$1' installed to continue."
    fi
}

lnif() {
    if [ -e "$1" ];
    then
        ln -sf "$1" "$2"
    fi
    ret="$?"
    debug
}

########## Setup function
backup() {
    if [ -e "$1" ];
    then
        msg "Attempting to back up your original configuration."
        today=$(date +%Y%m%d_%s)
        mv -v "$1" "$1.$today"

        ret="$?"
        success "Your original configuration has been backed up."
        debug
    fi
}

sync_repo() {
    local repo_path="$1"
    local repo_uri="$2"
    local repo_branch="$3"
    local repo_name="$4"

    #.vim is exist and is a git repo
    if [ -d "$repo_path/.git" ];
    then
        cd ${repo_path}
        local git_remote_url=$(git remote get-url `git remote` | grep tracyone | grep t-macs)
        #not my repo
        if [ -z ${git_remote_url} ];
        then
            msg "\033[1;34m==>\033[0m Find git repo $(git remote get-url `git remote`) in $repo_path!"
            msg "\033[1;34m==>\033[0m Backup to other place"
            backup "${repo_path}"
        fi
        cd -
    elif [ -d "${repo_path}" ];
    then
        # find ~/.vim and is not a git repo
        msg "\033[1;34m==>\033[0m Find $repo_path"
        msg "\033[1;34m==>\033[0m Backup to other place"
        backup "${repo_path}"
    fi

    if [ ! -d "$repo_path" ];
    then
        msg "\033[1;34m==>\033[0m Trying to clone $repo_name"
        mkdir -p "$repo_path"
        git clone  -b "$repo_branch" "$repo_uri" "$repo_path" 
        ret="$?"
        if [ $ret -eq 0 ]; then
            success "Successfully cloned $repo_name."
            cd ${repo_path}
            local latest_tag=$(git describe --tags `git rev-list --tags --max-count=1`)
            git checkout ${latest_tag}
            cd -
        fi
    else
        msg "\033[1;34m==>\033[0m Trying to update $repo_name"
        cd "$repo_path" && git fetch --all
        ret="$?"
        if [ $ret -eq 0 ]; then
            success "Successfully updated $repo_name"
            local latest_tag=$(git describe --tags `git rev-list --tags --max-count=1`)
            git checkout ${latest_tag}
        fi
    fi

    debug
}

create_symlinks() {
    local source_path="$1"
    local target_path="$2"

    mkdir -p ${target_path}

    lnif "$source_path/bundle"      "$target_path/"

    ret="$?"
    success "Setting up neovim symlinks."

    debug
}


########## Main()
program_must_exist "emacs"
program_must_exist "git"
program_must_exist "curl"

sync_repo       "$APP_PATH" \
                "$REPO_URI" \
                "$REPO_BRANCH" \
                "$app_name"


msg             "\nThanks for installing \033[1;31m$app_name\033[0m. Enjoy!"
