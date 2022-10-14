#!/bin/bash


PNG=/home/ezequiel/CursosAlura/ShellScript01/imagens-livros/PNG
JPG=/home/ezequiel/CursosAlura/ShellScript01/imagens-livros/JPG

cd ~/CursosAlura/ShellScript01/imagens-livros/

if [ ! -d PNG ]
  then
	  mkdir -p PNG ; sleep 5 ; chmod +x PNG ; echo "Diretório PNG criado com sucesso!"

  else
	  echo "Diretório PNG já Existe!"

fi

cd ~/CursosAlura/ShellScript01/imagens-livros/JPG

for imagem in *.jpg
  do

	imagem_sem_extensao=$( ls $imagem | awk -F. '{ print $1 }' )
	convert $JPG/$imagem_sem_extensao.jpg $PNG/$imagem_sem_extensao.png
done


