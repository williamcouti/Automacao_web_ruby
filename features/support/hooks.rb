Before do |scenario|

  Capybara.page.driver.browser.manage.window.maximize

  time1 = Time.new

  puts "\n"
  puts "                           **Teste Inicializado...*"
  puts "\n"
  puts "Dia e hora do inicio da execução: " + time1.inspect
  puts "\n"
  puts "**----------------------------------------------------------------------------**"
  puts "\n"

end

After do |scenario|

  scenario_name = scenario.name.gsub(/\s+/,'_').tr('/','_')

  if scenario.failed?

   tirar_foto(scenario_name.downcase!, 'Falhou')

   add_browser_logs


  else

    tirar_foto(scenario_name.downcase!, 'Passou')

  end


   puts "\n"
   time1 = Time.new
   puts "\n"
   puts "**----------------------------------------------------------------------------**"
   puts "\n"
   puts "Dia e hora do fim da execução: " + time1.inspect
   puts "\n"
   puts "                             **Teste Finalizado...**"

end

def add_browser_logs

  time_now = Time.now
  # Getting current URL
  current_url = Capybara.current_url.to_s
  # Gather browser logs
  logs = page.driver.browser.manage.logs.get(:browser).map {|line| [line.level, line.message]}
  #Remove warnings and info messages
  logs.reject! { |line| ['WARNING', 'INFO'].include?(line.first) }
  logs.any? == true
  embed(time_now.strftime('%Y-%m-%d-%H-%M-%S' + "\n") + ( "Current URL: " + current_url + "\n") + logs.join("\n"), 'text/plain', 'BROWSER ERROR')

end

at_exit do
  time = Time.now.getutc
  ReportBuilder.configure do |config|
  config.json_path = 'report.json'
  config.report_path = 'cucumber_web_report'
  config.report_types = [:html]
  config.report_tabs = %w[Overview Features Scenarios Errors]
  config.report_title = 'Cucumber Report Builder web automation test results'
  config.compress_images = false
  config.additional_info = { 'Project name' => 'Test', 'Platform' => 'Integration', 'Report generated' => time }
  end
  ReportBuilder.build_report
end

