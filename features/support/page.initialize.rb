Dir[File.join(File.dirname(__FILE__), '~\..\SIGS - Automação Web\Test SIGS\features\pages*.page.rb')].each {|file| require file}

module Page

  def login

    @login ||=  LoginPage.new

  end

  def home

    @home ||=  HomePage.new

  end

end
