function __zj_zjessions_menu -d "A Zellij session manager"
    if set -q "$__ZELLIJ_SESSIONS[1]"; or test -z "$__ZELLIJ_SESSIONS"
        set -U __ZELLIJ_SESSIONS
    end

    if not set -q __ZJESSIONS_OPEN
        set -l sessions_list (zellij ls)
        if [ (count $sessions_list) != (count $__ZELLIJ_SESSIONS) ];
            set e __ZELLIJ_SESSIONS; set -U __ZELLIJ_SESSIONS
            for s in $sessions_list
                switch $s
                    case "* (current)"
                        __zj_sessions -a (echo $s | sed 's/ (current)//')
                    case "*"
                        __zj_sessions -a $s
                end
            end
        end

        set_color red; printf "\t\t\t%s\n" "Zjessions Menu"
        set_color magenta
        printf "\t%s\n" "|-------------------------------------------|"
        set_color cyan
        printf "\t\t%s" "[ c ]"; set_color normal; printf "%s\n" " - Create new session"
        set_color cyan
        printf "\t\t%s" "[ s ]"; set_color normal; printf "%s\n" " - List sessions"
        set_color cyan
        printf "\t\t%s" "[ a ]"; set_color normal; printf "%s\n" " - Attach session"
        set_color cyan
        printf "\t\t%s" "[ k ]"; set_color normal; printf "%s\n" " - Kill session"
        set_color cyan
        printf "\t\t%s" "[ Q ]"; set_color red; printf "%s\n" " - Kill ALL sessions"
        set_color magenta
        printf "\t%s\n" "|-------------------------------------------|"
        set_color normal
        echo "Select an option or <Return> to cancel"
        set -U __ZJESSIONS_OPEN 1
        read -l -n 1 -P (echo "Zjessions option > ") action

        switch $action
            case 'c'
                __zj_create_session
            case 's'
                __zj_list_sessions
            case 'a'
                __zj_attach_session
            case 'k'
                __zj_kill_session
            case 'Q'
                set -e __ZJESSIONS_OPEN
                command zellij ka
                set_color red; echo "All sessions were killed"; set_color normal
            case "*"
                set_color yellow; echo "No option selected"; set_color normal
        end
        commandline -f repaint
        set -e __ZJESSIONS_OPEN
    end
end
