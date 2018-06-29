_gcloud-list-config-complete () {
    local cur=${COMP_WORDS[COMP_CWORD]}
    local project_list=""
    for i in ~/.config/gcloud/configurations/*; do
	project_list="${project_list} ${i##*config_}"
    done
    COMPREPLY=( $(compgen -W "${project_list[@]}" -- ${cur}) )
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

gcloud-disk-from-snapshot () {
    local -r project=$1
    local -r pdname=$2
    local -r snapname=$3
    
    gcloud --project "${project}" compute disks create "${pdname}" --source-snapshot "${snapname}"
}

gcloud-tmp-instance () {
    gcloud --project lumsites compute instances create try-upgrade-es-debian --boot-disk-type=pd-ssd --boot-disk-size=20G --disk=name=es-1-vm-root-debian8-try-upgrade
}

gcloud-instance-root-pd () {
    gcloud --project lumsites compute instances create try-upgrade-es-debian --disk=name=es-1-vm-root-debian8-try-upgrade,boot=yes
}

complete -F _gcloud-list-config-complete gcloud-project gcloud-project-exec
