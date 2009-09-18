require File.expand_path(File.dirname(__FILE__) + "/../lib/ruse")
require 'spec'
require 'cgi'

Ruse.logger = Logger.new(STDOUT)

def puts(stuff)
  super("#{CGI.escapeHTML(stuff)}</br>")
end