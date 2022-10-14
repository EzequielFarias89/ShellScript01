#!/bin/bash


cd ~/CursosAlura/ShellScript01/imagens-livros/

if [ -d PNG ]
  then
	sudo rm -rf ~/CursosAlura/ShellScript01/imagens-livros/PNG
	echo "Diretório Excluído com sucesso!"
fi


