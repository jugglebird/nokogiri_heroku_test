require 'rubygems'
require 'sinatra'
require 'nokogiri'
require 'open-uri'

$LOAD_PATH.unshift(File.dirname(__FILE__))

doc = Nokogiri::HTML(open('http://www.google.com/search?q=tenderlove'))

get '/' do
	doc.css('h3.r a.l').map do |link|
		link.content
	end.join("<br/>")
end
