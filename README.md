## Zjessions
This plugin is the result of some simple helper functions I wrote to help me better manage my [Zellij](https://github.com/zellij-org/zellij) sessions on [Fish](https://github.com/fish-shell/fish-shell).


This plugin provides a menu to access these functions.

### Features
- Create new Zellij sessions
- List and Close session
- Attach an open session


Detach a session with **`Ctrl+o` `d`**, Zellij's session mode.
Right now there's no Zellij action, as far as I know, for detaching a session from the command line.

## Installation
 - Fisher
     `fisher install thlsrms/zjessions.fish`

### Keybinding
 - Open the menu - **`Ctrl+w`**
	 - Rebind with: *`bind <YOUR_KEY_COMBINATION> __zj_zjessions_menu`* at your startup config.
	 - You can choose any key combination that fits you better
