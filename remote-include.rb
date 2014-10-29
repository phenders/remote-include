require 'net/http'
require 'uri'

module Jekyll
  class RemoteInclude < Liquid::Tag
  
    def initialize(tag_name, remote_include, tokens)
      super
    end
    
	def open(url)
	  Net::HTTP.get(URI.parse(url))
	end
    
    def render(context)
    
		open("#{context[@markup.strip]}")

    end
    
  end
end

Liquid::Template.register_tag('remote_include', Jekyll::RemoteInclude)