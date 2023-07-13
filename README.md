# README

Projeto de Testes Unitários

Requisitos:

* Criar um projeto Rails de Transferência de dinheiro entre contas e aplicar os testes:
    * A criação de contas inicia com saldo de R$ 100,00;
    * Toda conta tem um número;
    * Criar uma feature para transferir de uma conta para outra um determinado valor que não pode ser negativo;
    * Criar uma feature para visualizar o extrato da conta (débitos e créditos);
    * Não será possível ter saldo negativo;
    * Criar uma feature para bloquear uma conta;
    * Contas bloqueadas só podem tirar extrato;
    * Uma conta só pode ser bloqueada com saldo zerado.

Resumo do projeto:

O projeto Bank Transfer é um sistema de transferência bancária que permite aos usuários realizar transferências de dinheiro entre contas. Ele foi desenvolvido utilizando o framework Ruby on Rails e o banco de dados SQL. O objetivo principal do projeto é fornecer uma plataforma simples e segura para que os usuários possam realizar transações financeiras.

Principais funcionalidades:

* Criação e gerenciamento de contas bancárias.
* Realização de transferências de dinheiro entre contas.
* Bloqueio e desbloqueio de contas.
* Registro de movimentos de transações.

Tecnologias utilizadas:

* Ruby on Rails: Framework web utilizado para desenvolver o aplicativo.
* SQL: Banco de dados relacional usado para armazenar as informações das contas e movimentos.
* RSpec: Framework de testes utilizado para testar as funcionalidades do aplicativo.

Visão geral da estrutura:

* O projeto segue a estrutura padrão do Ruby on Rails, com a separação dos componentes em diretórios específicos. Os principais diretórios são:
    * app: Contém os modelos, controladores, visualizações e outros componentes relacionados à lógica de negócio do aplicativo.
    * db: Contém os arquivos de migração do banco de dados e o arquivo seeds.rb para população inicial dos dados.
    * spec: Contém os testes de unidade e integração escritos usando o framework RSpec.

Destaque dos pontos-chave:

* Verificar se as migrações foram aplicadas corretamente e se as tabelas do banco de dados foram criadas.
* Revisar as validações e associações definidas no modelo Conta para garantir que estão configuradas corretamente.
* Verificar se os testes de unidade e integração estão cobrindo adequadamente as funcionalidades principais do sistema.
* Revisar a lógica de bloqueio e desbloqueio de contas no modelo Conta para garantir que está funcionando corretamente.
