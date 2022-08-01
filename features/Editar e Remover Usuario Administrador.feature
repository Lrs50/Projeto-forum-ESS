Feature: Editar/Remover Usuário
As Moderador do Sistema
I want to Editar e/ou remover usuário administrador
So that Eu posso alterar ou remover usuários administradores já existentes no site de compartilhamento de reviews

Scenario: Edição bem sucedida de um usuário administrador
Given O sistema possui um usuário administrador com “Nome”, “ID” e “Senha” iguais a “Lucas”, “12392” e “1234”
And Eu estou logado como moderador do sistema
And Estou na página “Edição de Usuários”
When Eu seleciono o usuário administrador com “Nome”, “ID” e “Senha” iguais a “Lucas”, “12392” e “1234”
And Modifico o seu campo “Nome” para “Gabriel”
And Confirmo a modificação
Then Posso ver mensagem de confirmação
And O usuário administrador com “Nome”, “ID” e “Senha” iguais a “Lucas”, “12392” e “1234” é modificado no sistema para ter o seu “Nome” igual a “Gabriel"

Scenario: Remoção bem sucedida de um usuário administrador
Given O sistema possui um usuário administrador com “Nome” e “ID” iguais a “Lucas” e “12392”
And Eu estou logado como moderador do sistema
And Estou na página “Remoção de Usuários”
When Eu seleciono o usuário administrador com “Nome” e “ID” iguais a “Lucas” e “12392”
And Confirmo a remoção
Then Posso ver mensagem de confirmação
And O usuário administrador com “Nome” e “ID” iguais a “Lucas” e “12392” é removido do sistema

Scenario: Edição de ID mal sucedida por já existir outro usuário com mesmo ID
Given O sistema possui um usuário administrador com “Nome”, “ID” e “Senha” iguais a “Lucas”, “12392” e “1234”
And O sistema possui um usuário administrador com “Nome”, “ID” e “Senha” iguais a “Marcelo”, “12390” e “8123”
And Eu estou logado como moderador do sistema
And Estou na página “Edição de Usuários”
When Eu seleciono o usuário administrador com “Nome”, “ID” e “Senha” iguais a “Lucas”, “12392” e “1234”
And Modifico o campo “ID” para “12390”
And Confirmo a modificação
Then Posso ver mensagem de erro “Já existe um usuário com esse ID”

Scenario: Edição de ID mal sucedida por preenchimento inválido dos dados
Given O sistema possui um usuário administrador com “Nome”, “ID” e “Senha” iguais a “Lucas”, “12392” e “1234”
And Eu estou logado como moderador do sistema
And Estou na página “Edição de Usuários”
When Eu seleciono o usuário administrador com “Nome”, “ID” e “Senha” iguais a “Lucas”, “12392” e “1234”
And Modifico o seu campo “ID” para “Gabriel”
And Confirmo a modificação
Then Posso ver mensagem de erro “ID inválido!"

Scenario: Remoção mal sucedida de um usuário administrador pois o usuário já foi removido por outro administrador do sistema
Given O sistema possui um usuário administrador com “Nome” e “ID” iguais a “Lucas” e “12392”
And Eu estou logado como moderador do sistema
And Estou na página “Remoção de Usuários”
When Eu seleciono o usuário administrador com “Nome” e “ID” iguais a “Lucas” e “12392”
And Outro moderador do sistema remove o usuário com “Nome” e “ID” iguais a “Lucas” e “12392”
And Então eu confirmo a remoção
Then Posso ver mensagem de erro "Usuário não existente!", pois o usuário com “Nome” e “ID” iguais a “Lucas” e “12392” já foi removido do sistema

Scenario: Edição de ID mal sucedida pois o usuário foi removido por outro administrador do sistema
Given O sistema possui um usuário administrador com “Nome”, “ID” e “Senha” iguais a “Lucas”, “12392” e “1234”
And Eu estou logado como moderador do sistema
And Estou na página “Edição de Usuários”
When Eu seleciono o usuário administrador com “Nome”, “ID” e “Senha” iguais a “Lucas”, “12392” e “1234”
And Modifico o seu campo “Nome” para "Gabriel"
And Outro moderador do sistema remove o usuário com “Nome” e “ID” iguais a “Lucas” e “12392”
And Confirmo a modificação
Then Posso ver mensagem de erro "Usuário não existente!", pois o usuário com “Nome” e “ID” iguais a “Lucas” e “12392” foi removido do sistema
