class LoginPage < SitePrism::Page

  set_url '/cas/login?service=https%3A%2F%2Fqualidade.gps-pamcary.com.br%2FsigsWeb%2Flogin%2Fcas%3Fspring-security-redirect%3D%2Fapp%2Fweb%2Fhome'

  element :useremail,  :id, "username"
  element :usersenha,  :id, "password"
  element :entrar, 'input[value="ENTRAR1"]'


  def userLogin(email)

    useremail.set (email)

  end

  def userSenha(password)

    usersenha.set(password)

  end

  def userBtn

    entrar.click

  end

end

