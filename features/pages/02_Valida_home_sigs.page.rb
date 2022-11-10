class HomePage < SitePrism::Page

  #element :useref, :xpath,
  element :userName, :xpath, "/html/body[1]/app-root/app-main-menu/header/mat-toolbar/mat-toolbar-row[1]/div/span[2]"

  def loginSuccess

    #expect(userName.text).to eql 'Olá'
    expect(userName.text).to eql 'SUZIGLEI DA CRUZ BARRETO'

 end

end
