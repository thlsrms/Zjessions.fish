function __zj_list_sessions -d "List Zellij sessions"
    if set -q "$__ZELLIJ_SESSIONS[1]"
        set_color yellow; echo "No living sessions"; set_color normal
        return 1
    end
    for s in $__ZELLIJ_SESSIONS
        set_color yellow; printf "\t\t%s" "      $s"
        if contains -- $s $ZELLIJ_SESSION_NAME; set_color blue; printf "%s" " *"; end
        printf "\n" ""
    end
    set_color normal
end
