#!/bin/bash


cd ~/CursosAlura/ShellScript01/

if [ ! -d logs ] 
  then
	  mkdir -p logs ; sleep 5 ; chmod +x logs ; echo "Diretírio logs criado com sucesso!"
  else
	  echo "O diretório logs já existe"

fi



verifica_processos(){


CAMINHO_LOGS=~/CursosAlura/ShellScript01/logs
cd $CAMINHO_LOGS


	processos=$( ps -e -o pid --sort -size | head -n 11 | grep [0-9] )
	for pid in $processos 
	do
		nome_processo=$(ps -p $pid -o comm=)
		echo -n $(date +%F,%H:%M:%S,) >> $CAMINHO_LOGS/$nome_processo.log
		tamanho_processo=$(ps -p $pid -o size | grep [0-9])
		echo "$(bc <<< "scale=2;$tamanho_processo/1024")" >> $nome_processo.log
		

done


}


verifica_processos

if [ $? -eq 0 ]
  then
	  echo "Processo realizado com sucesso."

  else 
	  echo "Erro ao executar Processos."

fi
