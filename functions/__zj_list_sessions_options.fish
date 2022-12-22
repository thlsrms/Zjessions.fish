function __zj_list_sessions_options -d "List Zellij sessions options with their indexes"
    # The indexes used here are the ones as stored by __ZELLIJ_SESSIONS
    # to get the actual zellij --index we need to subtract by one
    set color magenta
    printf "\t%s\n" "|-------------------------------------------|"
    for i in (seq (count $__ZELLIJ_SESSIONS))
        set_color blue; printf "\t\t%s" "[ $i ]"
        set_color normal; printf "%s\n" " - $__ZELLIJ_SESSIONS[$i]"
    end
    set color magenta
    printf "\t%s\n" "|-------------------------------------------|"
    set_color normal
end
