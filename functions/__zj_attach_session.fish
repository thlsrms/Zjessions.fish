function __zj_attach_session -d "Attach to a existing Zellij session"
    if test "$ZELLIJ"
        # This behaviour is my personal preference to avoid nesting sessions
        # TODO: Add feature to make this optional
        echo "You need to detach before attaching to another session to avoid nesting sessions"
        set_color yellow; echo "<Ctrl> + O  ->  D"; set_color normal;
    else
        if [ (count $__ZELLIJ_SESSIONS) -gt 0 ];
            set_color green; printf "\n\t\t\t%s\n" "ATTACH"; set_color normal
            __zj_list_sessions_options

            echo "Leave it blank and press <Return> to cancel"

            set -f index
            if [ (count $__ZELLIJ_SESSIONS) -gt 9 ];
                set index $index (read -n 2 -P (echo "Session index to attach > "))
            else
                set index $index (read -n 1 -P (echo "Session index to attach > "))
            end

            if test "$index"; and string match --quiet --regex --invert '\D' $index
                if not [ "$index" -gt (count $__ZELLIJ_SESSIONS) ];
                    set -e __ZJESSIONS_OPEN
                    command zellij a $__ZELLIJ_SESSIONS[$index]
                else
                    set_color yellow; echo "Session index not found"; set_color normal
                end
            else
                set_color yellow; echo "No option selected"; set_color normal
            end
        else
            set_color green; printf "\t\t\t%s\n" "ATTACH";
            set_color magenta
            printf "\t%s\n" "|-------------------------------------------|"
            set_color yellow; printf "\t\t%s\n" "      No sessions alive"
            set_color magenta
            printf "\t%s\n" "|-------------------------------------------|"
            set_color normal

            read -f -n 1 -P (echo "Create a new session? [ y/N ] > ") response
            switch $response
                case 'y' 'Y'
                   __zj_create_session
                case '*'
            end
        end
    end
end
