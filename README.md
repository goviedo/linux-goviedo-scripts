# Notas Generales

Es buena idea dejar enlaces simbólicos para las configuracion en .config/ y estos enlaces apuntarlos a esta rama para mantener una consistencia en el tiempo con las configuraciones y si hay que configurar otro pc

# nvim

## Instalacion en Fedora
sudo dnf install nvim

## vim-plug

Vim plug es un Plugin manager minimalista. Este funciona con nvim, si queremos usar vundle, este dejo de tener soporte

Instalacion oficial: https://github.com/junegunn/vim-plug

Ayuda de instalacion en español:
URL: https://stsewd.dev/es/posts/neovim-plugins/

Para la instalacion, se debe configurar el archivo en:

$HOME/.config/nvim/init.vim

Con el siguiente instruccion adentro de los {{}}

{{
call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-surround'  " Es buena idea agregar una descripción del plugin

call plug#end()
}}

Para activarlo se debe presionar :so ~/.config/nvim/init.vim

Luego :PlugInstall

## Neovide

Neovide provee una mejora sustancial al placer de escribir en nvim. Esta construido en RUST.

URL: https://rustrepo.com/repo/neovide-neovide

Para mejorar el tamaño de la letra, tiene que ser configurada en $HOME/.config/nvim/init.vim con la siguiente instrucción:

set guifont=Fira\ Code:h10

Para obtener la lista de fuentes, ejecutar fc-list

