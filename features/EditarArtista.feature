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

Scenario: Mais de um artisca com o mesmo nome
Given eu estou logado como usuario "administrador" e senha "duck123"
And estou na pagina "Edição de artistas"
And o artista "Hulk Sanches" ID "12345" esta cadastrado no sistema
And o artista "Hulk Sanches" ID "12346" esta cadastrado no sistema
When preencho o campo "Nome" com "Hulk Sanches"
Then vejo uma mensagem "Como existem mais de um artista com o mesmo nome preencha a caixa de ID"
When preencho o campo "ID" com "12345"
Then Consigo editar o campo "Descrição" desse artista
When confirmar modificações 
Then vejo uma mensagem "Modificações feitas com sucesso"
And o sistema atualizou os dados do artista

Scenario: Mudança nula
Given eu estou logado como usuario "administrador" e senha "duck123"
And estou na pagina "Edição de artistas"
And o artista "Hulk Sanches"  esta cadastrado no sistema
When preencho o campo "Nome" com "Hulk Sanches"
Then Consigo editar o campo "Descrição" desse artista
And nenhuma moficicação é feita
When confirmar modificações 
Then vejo uma mensagem "Modificações feitas com sucesso"



