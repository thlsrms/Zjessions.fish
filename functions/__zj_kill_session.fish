function __zj_kill_session -d "Kills the specified Zellij session"
    if [ (count $__ZELLIJ_SESSIONS) -lt 1 ];
        set_color yellow; echo "Nothing to kill"; set_color normal
        return 1
    end

    set_color green; printf "\n\t\t\t%s\n" "KILL"; set_color normal
    __zj_list_sessions_options

    echo "Leave it blank and press <Return> to cancel"
    set -f index
    if [ (count $__ZELLIJ_SESSIONS) -gt 9 ];
        set index $index (read -n 2 -P (echo "Session index to kill > "))
    else
        set index $index (read -n 1 -P (echo "Session index to kill > "))
    end

    if test "$index"; and string match --quiet --regex --invert '\D' $index
        set -l session_name $__ZELLIJ_SESSIONS[$index]
        __zj_sessions -r $session_name
        if contains -- $session_name $ZELLIJ_SESSION_NAME; set -e __ZJESSIONS_OPEN; end
        command zellij k $session_name
        set_color green; printf "\t\t%s" "$session_name"
        set_color red; printf "%s\n" " killed"
    else
        set_color yellow; echo "No option selected"; set_color normal
    end
end
