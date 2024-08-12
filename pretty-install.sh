#!/bin/env zsh


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
if ! test -e /bin/kitty; then
  echo "Установка kitty >^ ^<"
  curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin launch=n
  
fi

echo "Установка тем для kitty >>^ ^<<"
git clone --depth 1 https://github.com/dexpota/kitty-themes.git ~/.config/kitty/kitty-themes


# Install nvim
mv_dirs(){
  cd ./nvim-linux64/
  mv ./bin/* /bin/
  mv ./lib/* /lib/
  mv ./share/ /share/
  rm -rf ./nvim-linux64
  cd ..
}


nvim_install(){
  VER=$(./version.py)
  echo "GLib >= 2.3 required"
  wget "https://github.com/neovim/neovim/releases/download/v$VER/nvim-linux64.tar.gz" && tar -xvf nvim-linux64.tar.gz && mv_dirs
  rm -f ./nvim-linux64.tar.gz 
}


T_V=$(nvim --version | sed "s/NVIM v//g" | sed "s/-dev-.*//g" | head -1)

if ! [[ $T_V ]]; then
  echo "nvim не установлен. Установить?"
  confirm && nvim_install 
fi

echo "Nvim version: $T_V"
IFS='.'
echo $T_V |  read f s t  

if [[ $s -lt 10 ]] ; then
  echo "NvChad не может работать с такой версией nvim! ($T_V)"
  echo "Удалите nvim с помощью вашего пакетного менеджера и затем перазапустите скрипт."
else
  echo "Гений программист гениально ставит NvChad под музыку Иу-Иу!"
  git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
fi





