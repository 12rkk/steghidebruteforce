#!/bin/bash

# Função para exibir a ajuda
usage() {
    echo "Uso: $0 -w <caminho_para_wordlist> -f <caminho_para_arquivo>"
    exit 1
}

# Inicializando variáveis
WORDLIST=""
FILE=""

# Processar os argumentos
while getopts "w:f:" opt; do
    case $opt in
        w) WORDLIST="$OPTARG" ;;
        f) FILE="$OPTARG" ;;
        *) usage ;;
    esac
done

# Verificar se as variáveis foram definidas
if [[ -z "$WORDLIST" || -z "$FILE" ]]; then
    usage
fi

# Verificar se a wordlist e o arquivo existem
if [[ ! -f "$WORDLIST" ]]; then
    echo "Wordlist não encontrada: $WORDLIST"
    exit 1
fi

if [[ ! -f "$FILE" ]]; then
    echo "Arquivo não encontrado: $FILE"
    exit 1
fi

# Contador de senhas
total_passwords=$(wc -l < "$WORDLIST")
echo "Total de senhas na wordlist: $total_passwords"

# Inicializando contador de tentativas
attempts=0

# Loop através de cada senha na wordlist
while IFS= read -r password; do
    # Incrementa o contador de tentativas
    ((attempts++))

    # Tenta extrair dados usando a senha atual
    steghide extract -sf "$FILE" -p "$password" > /dev/null 2>&1
    
    # Verifica se a extração foi bem-sucedida
    if [ $? -eq 0 ]; then
        echo -e "\nSenha encontrada: $password"
        echo "Total de tentativas: $attempts"
        break
    fi
    
    # Atualiza a tentativa atual na mesma linha
    echo -ne "Tentativa de senha ($attempts/$total_passwords)\r"
done < "$WORDLIST"

# Se o script terminar sem encontrar a senha
if [ $? -ne 0 ]; then
    echo -e "\nNenhuma senha válida encontrada após $attempts tentativas."
fi
