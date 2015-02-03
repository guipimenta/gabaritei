Projeto Gabaritei
=====================


1. Apresentação

    Plataforma educacional online voltada para escolas e cursinhos. Flexível e adaptável, tem como objetivo suprir
    de ser utilizado em diversos ambientes, com diversas combinações de hardware e software.

2. Tecnologia utilizada

    - Ruby on Rails
    - Bootstrap
    - Capybara
    - Selenium Web Driver
    
3. Sobre os testes

    Os testes foram criados sobre a base do rake, Capybara e Selenium. Devido a algumas limitações do SQLLite, tivemos que criar
    um novo environment chamdo "Selenium". Basicamente o que acontece é que rodar os testes usando o rake test:integration levanta
    um servidor no environment de testes padrão (acessando o banco de dados de teste). No entando, o Selenium necessita acessar uma
    url no servidor, fazendo com que nós tenhamos que subir um novo servidor usando o comando rails -s. Com dois servidores acessando
    o mesmo banco de dados, não é possível fazer com que as alterações feitas sejam gravadas efetivamente no arquivo sqlite.
    
    A solução adotada foi rodar o servidor em outro banco de dados usando outro environment. Dessa forma, toda a codificação foi
    jogada para dentro do método de inicialização do rake e é transparente ao desenvolvedor. Para rodar os testes, as gems do
    capybara e selenium web driver devem estar instaladas e o sistema deve ser Linux, Max OS X ou similar.
    
    Comandos:
    
    #instala as gems necessárias
    $ bundle install

    Uma task rake criada de forma customizada executa alguns comandos de inicalização do ambiente de testes (ver código para maiores detalhes) e depois roda o
    rake test:integration:

    $ rake custom_test_task:runtests_selenium

    Os testes necessitam do Google Chrome para serem executados (é possível trocar para o navegador firefox, caso necessário) e, também, do programa chromedriver.
    Para instalar o chromedriver, entre no site:

    <a href="http://chromedriver.storage.googleapis.com/index.html?path=2.14/">chromedriver download</a>

    Faça download do arquivo para o seu sistema operacional, depois copie o arquivo para uma pasta do seu path (ex: /usr/bin). Feito isso, os testes de integração
    devem rodar sem maiores problemas.