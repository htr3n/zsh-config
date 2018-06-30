# vim:syntax=sh
# vim:filetype=sh

function vb.headless(){
    if [[ ! $# -eq 1 ]] ; then
        echo "$0 <uuid | vm-name>"
        return 1
    else
        VBoxManage startvm $1 --type headless
    fi
}

function vb.control(){
	if [[ ! $# -eq 2 ]] ; then
        echo "$0 <command> <uuid | vm-name>"
        return 1
    else
        VBoxManage controlvm $2 $1
    fi

}
function vb.poweroff(){
	if [[ ! $# -eq 1 ]] ; then
        echo "$0 <uuid | vm-name>"
        return 1
    else
        vb-control poweroff $1
    fi
}
function vb.reset(){
	if [[ ! $# -eq 1 ]] ; then
        echo "$0 <uuid | vm-name>"
        return 1
    else
        vb-control reset $1
    fi
}
