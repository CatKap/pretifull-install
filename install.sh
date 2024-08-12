#!/bin/sh


echo 



# Install kitty 
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin launch=n


git clone --depth 1 https://github.com/dexpota/kitty-themes.git ~/.config/kitty/kitty-themes


confirm() {
    read -r -p "${1:  Вы точно Да? [y/N]} " response
    case "$response" in
        [yY][eE][sS]|[yY]|[дД]) 
            true
            ;;
        *)
            false
            ;;
    esac
}





