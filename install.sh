#!/bin/sh


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



# Install kitty 
if ! kitty; then
  echo "Установка kitty >^ ^<"
  curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin launch=n
  
fi

echo "Установка тем для kitty >>^ ^<<"
git clone --depth 1 https://github.com/dexpota/kitty-themes.git ~/.config/kitty/kitty-themes






