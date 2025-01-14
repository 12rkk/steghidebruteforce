# StegHideBruteForce

**StegHideBruteForce** é um script em Bash para realizar tentativas de extração de dados de arquivos protegidos com `steghide`, utilizando uma wordlist de senhas. 

## Requisitos

- `steghide` instalado no sistema.
- Ambiente Linux/Unix com Bash.

### Instalação do Steghide
Certifique-se de que o `steghide` está instalado. Em sistemas baseados em Debian/Ubuntu, use:

```bash
sudo apt update && sudo apt install steghide -y


Como usar
1. Faça o download do repositório
Clone este repositório para o seu sistema:
git clone https://github.com/12rkk/steghidebruteforce.git
cd steghidebruteforce

2. Torne o script executável
Dê permissão de execução ao script:
chmod +x steghidebruteforce.sh

3. Execute o script
Use o script com os seguintes parâmetros:
-w para especificar o caminho para a wordlist.
-f para especificar o caminho para o arquivo protegido.

./steghidebruteforce.sh -w wordlist.txt -f example.jpg

Saída esperada
Se a senha for encontrada, será exibida no terminal:
Senha encontrada: senha123
Total de tentativas: 42

Caso nenhuma senha funcione:
Nenhuma senha válida encontrada após X tentativas.
