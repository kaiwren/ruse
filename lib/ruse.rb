require "thread"
require "rubygems"
require "logger"

module Ruse
  def self.logger=(logger)
    @logger = logger
  end

  def self.logger
    @logger
  end
end

Ruse.logger = Logger.new(STDOUT)
Ruse.logger.level = Logger::DEBUG

case RUBY_PLATFORM
when /java/
else
  begin
    gem 'fastthread', '>= 1.0.1'
    require 'fastthread'
  rescue Gem::LoadError  
    Wrest.logger.debug "Unable to load fastthread, falling back to core Ruby threads. To install fastthread run `(sudo) gem install fastthread`"
  end
end

require "#{File.dirname(__FILE__)}/ruse/worker"
require "#{File.dirname(__FILE__)}/ruse/pool"
