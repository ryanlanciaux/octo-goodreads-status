#Liquid Tag for Last # Goodreads status updates for given account
# by: Ryan Lanciaux
# url: ryanlanciaux.com
#
# Example usage: {% goodreads %}
require 'net/http'
require 'rexml/document'
require 'date'
require 'fileutils'

module Jekyll
  class GoodreadsStatus < Liquid::Tag
    def initialize(tag_name, text, token)
      texter = (text.split("|") if text.include? "|") || [text]

      userid = (texter.length > 0 && texter[0]) || nil
      @pagecount = (texter.length > 1 && texter[1].to_i) || 3

      url = "http://www.goodreads.com/user_status/list/#{userid}?format=rss" unless userid ==  nil
      xml = Net::HTTP.get_response(URI.parse(url)).body
      @doco = ""
      unless xml.nil?
        @doco = REXML::Document.new(xml)
      end

    end

    def render(context)
      statuses = ""
      counts = 0
      if @doco.length > 0
        @doco.elements.each('rss/channel/item') do |woot|
          if counts >= @pagecount
            break
          end

          statuses << "<li>
            <a href='#{woot.elements['link'].text}' target='blank'>#{woot.elements['title'].text}</a>
            <span class='tiny'>(#{Date.parse(woot.elements['pubDate'].text)})</span></li>"
            counts+=1
        end
      else
        "<li>Error obtaining Goodreads RSS data</li>"
      end

      statuses
    end
  end
end

Liquid::Template.register_tag('goodreads', Jekyll::GoodreadsStatus)