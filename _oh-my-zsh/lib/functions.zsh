function zsh_stats() {
  history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n20
}

function uninstall_oh_my_zsh() {
  /usr/bin/env ZSH=$ZSH /bin/sh $ZSH/tools/uninstall.sh
}

function upgrade_oh_my_zsh() {
  /usr/bin/env ZSH=$ZSH /bin/sh $ZSH/tools/upgrade.sh
}

function take() {
  mkdir -p $1
  cd $1
}

function nwd () {
    echo "Creating Directory:: $1/"
    mkdir -p $1
    cd $1
}

function prj(){
if [ $1 ] ; then
    cd ~/Projects/$1
else 
    cd ~/Projects
fi
}

git_head_commit_id (){
    git rev-parse --short HEAD 2>/dev/null
}
tilde_or_pwd() {
  echo $PWD | sed -e "s/\/Users\/$USER/~/"
}

servepie () {
    if [ $1 ] ; then
        python -m SimpleHTTPServer $1
    else 
        python -m SimpleHTTPServer
    fi
}

flush-dns () {
    dscacheutil -flushcache
    sudo killall -HUP mDNSResponder

    echo "DNS Flushed"
}

# TIME FROM LAST COMMIT 
#
function minutes_since_last_commit {

    ref=$(git symbolic-ref HEAD 2> /dev/null) || return

    now=$(date +%s)
    last_commit=$(git log --pretty=format:'%at' -1 2>/dev/null)
    seconds_since_last_commit=$((now-last_commit))
    minutes_since_last_commit=$((seconds_since_last_commit/60))

      # Colorize the times
        # green = < 10min
        # yellow = < 30min
        # red = > 30min
     if [ "$minutes_since_last_commit" -gt 30 ]; then
       colored_time="%{$fg[red]%}"
     elif [ "$minutes_since_last_commit" -gt 10 ]; then
       colored_time="%{$fg[yellow]%}"
     else
       colored_time="%{$fg[green]%}"
     fi 
      colored_time+="%{$minutes_since_last_commit%}m"
      colored_time+="%{$reset_color%}" 

      #minutes_since_last_commit=$last_commit
      #echo $minutes_since_last_commit 
      #echo $colored_time
    
}
# 
# 
# function relative_time_since_last_commit {
#     last_commit=`git log --pretty=format:'%ar' -1`
#     echo ${last_commit}
# }
 
# function format_unit {
#     local UNIT=$1
#     case "$UNIT" in
#         seconds)    UNIT="s"    ;;
#         minutes)    UNIT="m"    ;;
#         hours)      UNIT="h"    ;;
#         days)       UNIT="d"    ;;
#         weeks)      UNIT="w"    ;;
#         months)     UNIT="mo"   ;;      
#         years)      UNIT="yr"   ;;      
#         *);;
#     esac
#     echo ${UNIT}
# }     
 
# function color_based_on_unit {
#     local UNIT=$1
#     if [ "$UNIT" == "s" ] || [ "$UNIT" == "m" ]; then
#         local COLOR=${GREEN}  
#     elif [ "$UNIT" == "h" ]; then
#         local COLOR=${YELLOW} 
#     else
#         local COLOR=${RED}    
#     fi
#     echo ${COLOR}
# }
 
# git_prompt_commit_delta() {
#     local g="$(__gitdir)"
#     if [ -n "$g" ]; then
#         local SINCE_LAST_COMMIT=$(relative_time_since_last_commit)
#         SINCE_LAST_COMMIT=(${SINCE_LAST_COMMIT// / })
#         local VALUE=${SINCE_LAST_COMMIT[0]}
#         local UNIT=$(format_unit ${SINCE_LAST_COMMIT[1]/,/})
 
#         # for old projects, git reports years and months
#         if [ ${SINCE_LAST_COMMIT[2]} != "ago" ]; then
#             local EXTRA_VALUE=${SINCE_LAST_COMMIT[2]}
#             local EXTRA_UNIT=$(format_unit ${SINCE_LAST_COMMIT[3]/,/})
#         fi
 
#         local COLOR=$(color_based_on_unit $UNIT)
#         local DELTA="${VALUE}${UNIT}${EXTRA_VALUE}${EXTRA_UNIT}"
        
#         # The __git_ps1 function inserts the current git branch where %s is
#         local GIT_PROMPT=`"%s ∆${COLOR}${DELTA}${NORMAL}"`
#         echo " ${GIT_PROMPT}"
#     fi
#   }
