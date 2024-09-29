#!/bin/bash

#-//Colors

PR='\033[30m'
VR='\033[31m'
VE='\033[32m'
AM='\033[33m'
AZ='\033[34m'
MA='\033[35m'
CI='\033[36m'
RS='\033[37m'

if [ "$1" == "" ]

then 

echo -e "
${MA}
${MA}                 ,---------------------------,
${MA}                 |  /---------------------\  |
${MA}                 | |                       | |
${MA}                 | |  ${RS}Tool for${MA}             | |                                    
${MA}                 | |  ${RS}   analyzing input${MA}   | |
${MA}                 | |  ${RS}             data${MA}    | |${RS}                  _____               _             _  
${MA}                 | |                       | |          ${RS}       |  __ \             (_)           | |
${MA}                 |  \_____________________/  |          ${RS}       | |__) |_ _ _ __ ___ _ _ __   __ _| | ___     
${MA}                 |___________________________|          ${RS}       |  ___/ _  |  __/ __| |  _ \ / _  | |/ _ |
${MA}               ,---\_____     []     _______/------,    ${RS}       | |  | (_| | |  \__ \ | | | | (_| | |  __/
${MA}             /         /______________\           /|    ${RS}       |_|   \__,_|_|  |___/_|_| |_|\__, |_|\___|
${MA}           /___________________________________ /  | __ ${MA}       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~${RS} ___/ |${MA}~~~~~~~   
${MA}           |                                   |   |   )${RS}      Created By                   /____/   
${MA}           |  _ _ _                 [-------]  |   |  ( ${RS}            ${MA}Christopher  
${MA}           |  o o o                 [-------]  |  /   _)_                   Rissardi                         
${MA}           |__________________________________ |/    /  /                   
${RS}       /-------------------------------------/|${MA}     ( )/                    
${RS}     /-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/ /
${RS}   /-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/ /
${RS}   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

${MA}- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -${RS}

{${MA}?${RS}} Insira a URL do site que deseja fazer a verificação de Parsing. Abaixo o exemplo de como usar:

{${MA}!${RS}} Use ./parsingle.sh e a URL que deseja verificar
{${MA}*${RS}} Exemplo: ./parsingle.sh nasa.gov

Observação: não insira o parâmetro do http/https! Insira apenas a URL do site sem o https://
Pode ser usado das seguintes maneiras: site.com ou www.site.com. As duas formas irão funcionar!"

else


echo -e "
${MA}
${MA}                 ,---------------------------,
${MA}                 |  /---------------------\  |
${MA}                 | |                       | |
${MA}                 | |  ${RS}Tool for${MA}             | |                                    
${MA}                 | |  ${RS}   analyzing input${MA}   | |
${MA}                 | |  ${RS}             data${MA}    | |${RS}                  _____               _             _  
${MA}                 | |                       | |          ${RS}       |  __ \             (_)           | |
${MA}                 |  \_____________________/  |          ${RS}       | |__) |_ _ _ __ ___ _ _ __   __ _| | ___     
${MA}                 |___________________________|          ${RS}       |  ___/ _  |  __/ __| |  _ \ / _  | |/ _ |
${MA}               ,---\_____     []     _______/------,    ${RS}       | |  | (_| | |  \__ \ | | | | (_| | |  __/
${MA}             /         /______________\           /|    ${RS}       |_|   \__,_|_|  |___/_|_| |_|\__, |_|\___|
${MA}           /___________________________________ /  | __ ${MA}       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~${RS} ___/ |${MA}~~~~~~~   
${MA}           |                                   |   |   )${RS}      Created By                   /____/   
${MA}           |  _ _ _                 [-------]  |   |  ( ${RS}            ${MA}Christopher  
${MA}           |  o o o                 [-------]  |  /   _)_                   Rissardi                         
${MA}           |__________________________________ |/    /  /                   
${RS}       /-------------------------------------/|${MA}     ( )/                    
${RS}     /-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/ /
${RS}   /-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/ /
${RS}   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

${MA}- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -${RS}"

echo ""
echo ""
echo -e "{${MA}!${RS}} ${MA}Fazendo a primeira verificação de Parsing! Por favor, aguarde.${RS}"
echo ""
echo ""

sleep 2
wget -q -O $1.txt $1

for url in $(sort $1.txt | grep "http" | cut -d "/" -f 3 | grep -v ">" | grep -v "<" | grep -v ";" | grep -v "http" | sort -u);

do host $url | grep "has address" | sed 's/has address/ -------------->>/'
done

sleep 2

echo ""
echo ""
echo -e "{${MA}!${RS}} ${MA}Extraindo URLS relevantes presentes no HTML da página! Por favor, aguarde${RS}"
echo ""
echo ""

sleep 2

sort $1.txt | grep "http" | grep "href" | cut -d ">" -f 2 | cut -d '"' -f 2 | grep -v ">" | grep -v "<" | sort | grep "http" | cut -d "/" -f 3 | sort -u
sort $1.txt | grep "http" | cut -d "=" -f 2 | cut -d '"' -f 2 | grep "http" | grep -v ">"

echo ""
echo ""
echo -e "{${MA}!${RS}} ${MA}Buscando informações de Whois${RS}"
echo ""
echo ""
sleep 4
whois $1
echo ""

rm $1.txt

echo -e "{${MA}!${RS}} ${MA}Se você não encontrou nenhum resultado para sua busca, confira o domínio do site e/ou ajuste o script conforme sua necessidade.${RS}"
echo -e "{${MA}!${RS}} Qualquer problema ou dúvida, entre em contato: ${MA}https://github.com/christopherrissardi${RS}"
fi
