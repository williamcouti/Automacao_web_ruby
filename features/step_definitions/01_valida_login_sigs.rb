Dado('que eu informo meu usuario') do

 login.load

 login.userLogin(CREDENTIAL[:user][:email])

end

Dado('eu informo minha senha') do

  login.userSenha(CREDENTIAL[:password][:password])

end

Quando('eu clicar no botao entrar') do

  login.userBtn

end

Então('verifico se o usuario logou com sucesso') do

 home.loginSuccess

end
