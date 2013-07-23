require 'yaml'

raw_config = File.read('spec/support/live.yml')
KLARNA_EDI = YAML.load(raw_config)['edi'] unless ENV['EDI']
KLARNA_SS  = YAML.load(raw_config)['shared_secret'] unless ENV['KLARNA_SS']