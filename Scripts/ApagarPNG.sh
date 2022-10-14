#!/bin/bash

varrer_diretorios(){

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
                sudo rm -rf  *.png
          fi
done

}

varrer_diretorios
