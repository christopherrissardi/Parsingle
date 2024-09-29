# 🐦 Parsingle

Ferramenta criada com o intúito de como qualquer outra ferramenta de Parsing, analisar o texto bruto do HTML da página e extrair informações de URLS, IPs, servidores e outros. A ferramenta em questão é um projeto bem simples comparado a outros que existem por ai, porém é bem útil e bem fácil de usar.

![image](https://github.com/user-attachments/assets/14f26ed5-2c8f-46e9-93c7-16cfe1017668)


## ✔️ Requisitos para uso

Apenas ter um dispositivo Linux.

## ⛏️ Como usar

1. Clone este repositório usando a ferramenta do [git](https://git-scm.com/) ou baixe o repositório em ZIP clicando em `<> Code`

```bash
git clone https://github.com/christopherrissardi/Parsingle.git
```

2. Entre na pasta do repositório clonado

```bash
cd Parsingle
```

3. Dê permissão de execução ao script usando o terminal.

```bash
sudo chmod +x ./parsingle.sh
```

4. Execute o script passando a URL do site que você deseja verificar.

```bash
./parsingle.sh nasa.gov
```

Observação: Não passe a URL completa, ou seja, não inclua na busca `http` ou `https://` ou qualquer outro subdiretório do site como `nasa.gov/alienigenas`. Insira a URL crua como mostrado no exemplo acima. No máximo utilize `www` se a URL em questão não tiver resposta/retorno de nenhum IP.

Caso exista a necessidade de alterar o script para usar em um site específico ou algo relacionado, fique a vontade para editar e personalizar de sua preferência.


## 👁️‍🗨️ Observações

Alguns sites bloqueiam essa prática usando o scripts, já que o método responsável por baixar todo o conteúdo do HTML dá página é o wget e pode ser detectado por algum IPS ou até mesmo por um WAF dependendo do contexto. Em alguns momentos, o algorítmo do google pode solicitar a verificação de reCAPTCHA para previnir atividades consideradas suspeitas.
