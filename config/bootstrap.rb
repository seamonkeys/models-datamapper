ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __FILE__)

if File.exists?(ENV['BUNDLE_GEMFILE'])
  require 'bundler/setup'
  Bundler.require(:default, 'development')
end