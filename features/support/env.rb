require 'capybara'
require 'capybara/cucumber'
require 'capybara/rspec'
require 'site_prism'
require 'site_prism/all_there'
require 'rspec'
require 'report_builder'

include RSpec::Matchers

require_relative 'page.initialize.rb'
require_relative 'helper.rb'


AMBIENTE = ENV['AMBIENTE']

CONFIG = YAML.load_file(File.dirname(__FILE__) + "/ambientes/#{AMBIENTE}homolog.yml")

World(Page)
World(Helper)



Capybara.configure do |config|

  config.default_driver = :selenium_chrome
  config.app_host = CONFIG['url_Qualidade']
  config.default_max_wait_time = 5

end
