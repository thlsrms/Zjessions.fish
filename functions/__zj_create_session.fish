function __zj_create_session -d "Create a new session and attach to Zellij"
    if [ (count $__ZELLIJ_SESSIONS) -gt 0 ];
        set_color green; printf "\n\n\t\t\t%s\n" "Living sessions"
        set_color magenta
        printf "\t%s\n" "|-------------------------------------------|"
        set_color normal

        for i in (seq (count $__ZELLIJ_SESSIONS))
            printf "\t\t%s\n" "      $__ZELLIJ_SESSIONS[$i]"
        end

        set_color magenta
        printf "\t%s\n" "|-------------------------------------------|"
        set_color normal
    end

    echo "Type a name or leave it blank to generate one"
    read -l -P (echo "Session name > ") name

    if test "$name"; and contains $name $__ZELLIJ_SESSIONS
        set_color red; echo "Session name already in use"; set_color normal
        return 1
    end

    if test "$ZELLIJ"
        if test "$name"
            command $TERM -e zellij -s $name &; disown
        else
            command $TERM -e zellij &; disown
        end
    else
        if test "$name"
            command zellij -s $name
        else
            command zellij
        end
    end

    printf "%s" "Session"
    if test "$name"; set_color yellow; printf "%s" " $name"; set_color normal; end
    printf "%s\n" " created"
end
