Feature: Criação e remoção usuario ADM
    As moderador do sistema
    I Want to criar e remover contas de usuario administrador
    So that Eu possa controlar a remoção e a criação de novos usuarios administradores num site de compartilhamento de reviews

Scenario: Criação bem sucedida de um usuário administrador
Given eu sou o moderador do sistema
And estou na pagina "cadastro de usuario administrador"
When eu preencho os campos para criação de usuário "administrador" com "apelido" "Lucas Reis" e "senha" "3PYP0"
Then eu vejo uma mensagem de confirmação
And o usuário administrador "Lucas Reis" foi adicionado no sistema

Scenario: Criação mal sucedida de um usuário administrador
Given eu sou o moderador do sistema
And estou na página "Cadastro de usuário administrador"
When eu não preencho os campos para criação de usuário "administrador" com "apelido" "Lucas Reis" e "senha" "3PYP0"
Then eu vejo uma mensagem de erro "existem campos obrigatórios não preenchidos"

Scenario: Remoção bem sucedida de um usuário administrador
Given eu sou o moderador do sistema
And o usuário administrador com "Nome" "Lucas Reis" e "ID" "1981" está cadastrado no sistema
And estou na página "Remoção de usuário administrador"
When eu removo o usuário com "Nome" "Lucas Reis" e "ID" "1981"
Then eu vejo uma mensagem de confirmação
And o usuário administrador "Lucas Reis" foi removido do sistema

Scenario: Remoção mal sucedida de um usuário administrador
Given eu sou o moderador do sistema
And o usuário administrador com "Nome" "Lucas Reis" e "ID" "1981" não está cadastrado no sistema
And estou na página "Remoção de usuário administrador"
When eu removo o usuário com "Nome" "Lucas Reis" e "ID" "1981"
Then eu vejo uma mensagem de erro "Usuário administrador não existente"

Scenario: Criação mal sucedida de um usuário administrador por ja existir alguem com aquele determinado apelido
Given eu sou o moderador do sistema
And o usuário administrador com "apelido" "Lucas Reis" está cadastrado no sistema
And estou na pagina "cadastro de usuario administrador"
When eu preencho os campos para criação de usuário "administrador" com "apelido" "Lucas Reis" e "senha" "3PYP0"
Then eu vejo uma mensagem de erro  "Já existe um usuario com esse apelido"

Scenario: Remoção mal sucedida de um usuário administrador por erro match entre o ID e o Nome
Given eu sou o moderador do sistema
And o usuário administrador com "Nome" "Lucas Reis" e "ID" "1991" está cadastrado no sistema
And estou na página "Remoção de usuário administrador"
When eu removo o usuário com "Nome" "Lucas Reis" e "ID" "1981"
Then eu vejo uma mensagem de erro "O usuario e o ID fornecidos não formam uma combinação existente"
