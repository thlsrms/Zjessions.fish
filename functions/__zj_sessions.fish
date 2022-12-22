function __zj_sessions -d "Update Zellij Sessions list. | Usage: __zj_sessions [-a | -r] VALUE"
    set -l index (contains -i -- $argv[2] $__ZELLIJ_SESSIONS)
    switch $argv[1]
        case '-a'
            if test -z "$index"
                set -a __ZELLIJ_SESSIONS $argv[2]
            end
        case '-r'
            if test "$index"
                set -e __ZELLIJ_SESSIONS[$index]
            end
    end
end
