Feature: Editar artista
    As administrador do sistema
    I Want to editar paginas de artistas
    So that Eu possa atualizar, corrigir, modificar informações dos artistas do sistema

Scenario: Edição bem sucedida da pagina de um artista
Given eu estou logado como usuario "administrador" e senha "duck123"
And estou na pagina "Edição de artistas"
And o artista "Hulk Sanches"  esta cadastrado no sistema
When preencho o campo "Nome" com "Hulk Sanches"
Then Consigo editar o campo "Descrição" desse artista
When confirmar modificações 
Then vejo uma mensagem "Modificações feitas com sucesso"
And o sistema atualizou os dados do artista

Scenario: Artista não existente
Given eu estou logado como usuario "administrador" e senha "duck123"
And estou na pagina "Edição de artistas"
And o artista "Hulk Sanches"  não esta cadastrado no sistema
When preencho o campo "Nome" com "Hulk Sanches"
Then vejo uma mensagem "Não existe nenhum artista com o nome fornecido"
When OK
Then retorno a pagina "Edicao de artistas"
