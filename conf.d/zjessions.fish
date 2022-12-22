if not status is-interactive
    exit
end


set -e __ZJESSIONS_OPEN
if test "$ZELLIJ"
    if not contains -- $ZELLIJ_SESSION_NAME $__ZELLIJ_SESSIONS
        __zj_sessions -a $ZELLIJ_SESSION_NAME
    end
else
    # Autostart ZELLIJ
    if not set -q __ZELLIJ_SESSIONS; or not set -q __ZELLIJ_SESSIONS[1]
        eval (zellij setup --generate-auto-start fish | string collect)
        __zj_sessions -a $ZELLIJ_SESSION_NAME
    end
    __zj_attach_session
    commandline -f repaint
end


function _zjessions_install --on-event zjessions_install
    set -U __ZELLIJ_SESSIONS
    bind \cW __zj_zjessions_menu
end

function _zjessions_uninstall --on-event zjessions_uninstall
    set -e __ZELLIJ_SESSIONS
    set -e __ZJESSIONS_OPEN
    bind -e \cW
end

