# MultiThread_Download
Sistema desenvolvido em DELPHI para realizar o download de arquivos via HTTP, utilizando MultiThread e padrões de projeto.

# Ambiente e Configuração 
-> Para o projeto em questão foi utilizado a versão **Delphi XE7**, apenas com componentes e configurações nativas da própria IDE. 

-> Foi utilizado o **SQLite** como ferramenta para armazenar os dados, na pasta raiz do projeto existe um arquivo **Script_BD.sql** com a criação da tabela principal, bem como alguns registros de teste. 

-> O caminho do arquivo .DB está configurado manualmente dentro do projeto, ou seja, é necessário revisar a propriedade **DataBase** do componente **Connection** dentro do arquivo **dtmMain.pas**, para que esteja de acordo com o caminho do seu banco de dados.

# Instruções do Programa
-> O sistema tem por objetivo realizar o download de arquivos via HTTP, onde se faz necessário informar a URL do arquivo que se deseja baixar.

-> O destino do arquivo a ser baixado, é o mesmo caminho da aplicação **MultiThread_Download.exe**.


Author: **Luiz Felipe Campos**



