#!/bin/bash

# Criar a Função
converte_imagem(){

# Acessar o diretório imagens-livros
cd ~/CursosAlura/ShellScript01/imagens-livros



# Verificar se o diretório PNG já existe, caso não exista será criado
if [ ! -d PNG ]
  then

	  mkdir -p PNG ; sleep 5 ; chmod +x PNG ; echo "Diretório Criado com sucesso!"
  else
	  echo "O Diretório PNG já existe!"

fi


# Criamos duas Constantes local para os diretórios PNG e JPG
local PNG=~/CursosAlura/ShellScript01/imagens-livros/PNG/
local JPG=~/CursosAlura/ShellScript01/imagens-livros/JPG/


# Acessar o diretório que contem as imagens para serem transformadas
cd ~/CursosAlura/ShellScript01/imagens-livros/JPG/



# Usaremos um For juntamente com o AWK para tratar os arquivos .jpg e transformar em .PNG
for imagem in *.jpg
do 
	local imagens_sem_extensao=$( ls $imagem | awk -F. '{ print $1 }'  )
	convert $JPG/$imagens_sem_extensao.jpg /$PNG/$imagens_sem_extensao.png
done

# Fechar a Função
}

# Invocar a Função inserindo as mensagens de erros para o arquivo de log que vamos criar
converte_imagem 2>>~/CursosAlura/ShellScript01/logs/erro.conversao.txt


#Verificar se a conversão foi realizada com sucesso. Sucesso resultado 0 ; Não sucesso Resultado 1 até 255. Para verificar o Status do comando use $?
if [ $? -eq 0 ]
  then
	  echo "Conversão Realizada com Sucesso!"
  else
	  echo "Erro! Problema para realizar a conversão das imagens! Favor verificar nos logs erro.conversao.txt"

fi





