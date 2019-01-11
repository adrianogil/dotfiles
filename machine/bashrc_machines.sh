# load machine name form
machine_name=""
machine_define_file=$HOME/.machine

[ -f "$machine_define_file" ] && machine_name=$(cat "$machine_define_file")

export CURRENT_MACHINE=$machine_name

function dot-machine-name()
{
    echo $CURRENT_MACHINE
}
alias dmn="dot-machine-name"