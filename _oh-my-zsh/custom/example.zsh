# Add yourself some shortcuts to projects you often work on
# Example:
#
# brainstormr=/Users/robbyrussell/Projects/development/planetargon/brainstormr
#
function testPrjFns () {
    tput cols
}

function pj () {
    local _prjdir="$HOME/Projects"
    if [ -n "$1" ]; then
        cd ${_prjdir}/$1;
    else
        cd ${_prjdir}
    fi
}
