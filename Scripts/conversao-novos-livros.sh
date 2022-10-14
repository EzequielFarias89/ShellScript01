#!/bin/bash

# Criar uma função para converter as imagens JPG para PNG e chamar essa função la no else dentro do for da função Varredura.

converter_imagem(){

# Criar a variavel $1 vamos adicionar em outra variável para não confundir com a da Função Varrer_diretorios
	local caminho_imagem=$1
	local imagem_sem_extensao=$( ls $caminho_imagem | awk -F. '{ print $1 }'  )
	convert $imagem_sem_extensao.jpg $imagem_sem_extensao.png


}




# Criar Função para realizar a varredura

varrer_diretorios(){


#Acessar o diretório principal onde estão os outros diretórios com arquivos e pastas.
cd $1

# Realizar verificação nos diretórios
for arquivo in *
  do
	# Passar o caminho onde será realizado a varredura, vamos armazenar em uma variável local
	 local caminho_arquivo=$(find ~/CursosAlura/ShellScript01/imagens-novos-livros -name $arquivo)
	 

  	# Verificar se é um arquivo ou diretório
          if [ -d $caminho_arquivo ]
	    then
	  	# Chamar a Função para realizar a verificação nos diretórios dentro da variável especificada no for
		  varrer_diretorios $caminho_arquivo

	    else
		converter_imagem $caminho_arquivo
	  fi



done	  

}


varrer_diretorios ~/CursosAlura/ShellScript01/imagens-novos-livros/
if [ $? -eq 0 ]
   then
   	echo "Conversão realizada com sucesso"

   else 
   	echo "Houve um problema na conversão"	   


fi









