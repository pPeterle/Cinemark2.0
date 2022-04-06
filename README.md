# Cinemark 2.0

Projeto desenvolvido em flutter em 6 horas utilizando a api do ingresso.com para listagem dos filmes em cartaz e em breve no Cinemark de todo o país.

### Features
- [x] Layout moderno com utilização de animações
- [x] Estrutura escalável
- [x] Configurações salvas localmente
- [x] Testes Unitários


## Estrutura

A estrutura do projeto foi feita utilizando o flutter_modular, mesmo que seja um projeto inicalmente simples, é uma arquitetura que gosto de utilizar.

### Módulos

Cada módulo possui seus próprios modelos e repositórios, a estrutura interna de cada módulo é um MVC

- Store -> Controller (Mapeia os dados vindo dos banco e cuida da regra de negócio da view)
- Repository -> Models (Responsável pela conexão com o banco de dados tanto local quanto externo a aplicação)
- View -> As páginas do aplicativo que possuem pouca regra de negócio

## Próximos Passos

- Finalizar os testes
- Criar tela de detalhes de cada filme
- Favoritar Filmes
- Cache das Requisições

