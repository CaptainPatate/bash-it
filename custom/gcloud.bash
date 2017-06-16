_gcloud-list-config-complete () {
    local cur=${COMP_WORDS[COMP_CWORD]}
    local project_list=$(gcloud config configurations list --format='value(name)')
    COMPREPLY=( $(compgen -W "${project_list}" -- ${cur}) )
}

gcloud-project () {
    if [ $# -eq 0 ]; then
	gcloud config configurations list --filter='IS_ACTIVE=True'
    else
	gcloud config configurations activate "$1"
    fi
}

gcloud-project-exec () {
    local current_project=$(gcloud config configurations list --format='value(name)' --filter='is_active=True')
    local temp_project="$1"
    shift 1
    gcloud-project $temp_project
    gcloud "$@"
    gcloud-project $current_project
}

complete -F _gcloud-list-config-complete gcloud-project gcloud-project-exec
