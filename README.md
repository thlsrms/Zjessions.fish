## Zjessions
This plugin is the result of some simple helper functions I wrote to help me better manage my [Zellij](https://github.com/zellij-org/zellij) sessions on [Fish](https://github.com/fish-shell/fish-shell).


This plugin provides a menu to access these functions.

### Features
- Create new Zellij sessions
- List and Kill session
- Attach an open session


Detach a session with **`Ctrl+o` `d`**, Zellij's session mode.
Right now there's no Zellij action, as far as I know, for detaching a session from the command line.

## Installation
 - Fisher
    ```fish
    fisher install thlsrms/zjessions.fish
    ```

### Keybinding
 - Open the menu - **`Ctrl+w`**
    - To remap it: At your startup configuration file:
    ```fish
    # Revert Ctrl+w back to its default or `bind \cW -e` to unbind it
    bind \cW backward-kill-word
    bind <YOUR_KEY_SEQUENCE> __zj_zjessions_menu
    ```
	- You can choose any key combination that fits you better
