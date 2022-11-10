#methodo de tirar foto se passou ou falhou o teste.

module Helper

  def tirar_foto(nome_arquivo, resultado)

    caminho_arquivo = "report/screenshots/Print_Test#{resultado}"

    foto = "#{caminho_arquivo}/#{nome_arquivo}.png"

    page.save_screenshot(foto)



  end

end
