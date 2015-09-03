require 'launchy'
require 'nokogiri'
require 'open-uri'
require 'pry'
require 'rspec'
require 'axlsx'
require 'mechanize'
require 'watir'
mechanize = Mechanize.new
browser = Watir::Browser.new
page = mechanize.get('https://www.sec.gov/cgi-bin/browse-edgar?CIK=amt&Find=Search&owner=exclude&action=getcompany')
browser.goto page.uri.to_s
doc = Nokogiri::HTML(open(page.uri.to_s))
#interate through each of the interactive links
name = doc.css('#interactiveDataBtn')[2].parent.parent.children[1].children.text
link = doc.css('#interactiveDataBtn')[2].attributes['href'].value
base_uri = "http://sec.gov"
whole_link = base_uri.concat(link)
browser.goto whole_link
print whole_link, name
binding.pry
