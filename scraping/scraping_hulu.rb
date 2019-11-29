require 'watir'
require 'nokogiri'
browser = Watir::Browser.new(:chrome, {:chromeOptions => {:args => ['--headless', '--window-size=1200x600']}})
browser.goto('https://www.hulu.com/live-tv')
html_doc = Nokogiri::HTML(browser.html)
puts "Channels"
puts "-------------------------------------------------------------"
html_doc.css('img').map do |image|
	class_icon = image['class']
	network_icon = 'network-icon ls-is-cached lazyloaded'
	network_icon1 = 'network-icon lazyload'
	if class_icon.to_s == network_icon.to_s || class_icon.to_s == network_icon1.to_s
		puts image['alt']
	end
end
puts "-------------------------------------------------------------"

puts "Add-ons"
puts "-------------------------------------------------------------"
html_doc.css("div").map do |divisions|
	class_icon = divisions['class']
	req_icon = 'jsx-3636485725 plan-card__addons'
	if class_icon.to_s == req_icon.to_s
		divisions.css('li').map do |addons|
			puts addons.text
		end
	end
end
puts "-------------------------------------------------------------"
