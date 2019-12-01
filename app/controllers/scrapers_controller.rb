require 'watir'
require 'nokogiri'

def get_packages_local_sling
    index = 0
    packages_list = []

    ["scraping/orange.html", "scraping/blue.html", "scraping/orange_blue.html"].each do |package|
        
        html_doc = Nokogiri::HTML(File.read(package))
        
        cost_list = html_doc.css('.dyn-grid_package-title')
        name_list = html_doc.css('.dyn-grid_package-subtitle')
        
        package_cost_list = cost_list.zip(name_list).map do |cost, pack|
            [pack.text, cost.text[/[\d]+/]]
        end
        
        count = html_doc.css('#channelList').css('img').count
        channels_list = html_doc.css('#channelList').css('img').map do |channel|
            channel['title']
        end
        
        packages_list << [package_cost_list[index][0], channels_list, count, package_cost_list[index][1]]
        index += 1
    end
    
    packages_list
end


def get_addons_local_sling
    html_doc = Nokogiri::HTML(File.read("scraping/orange.html"))
    
    addon_list = []
    html_doc.css('//div[@data-sling-tab-name]').each do |category|
        addon_category = category['data-sling-tab-name']
        channels_list = category.css('.carousel-jam_channel-container').css('img').map do |image|
            image['alt']
        end
        cost = category.css('.carousel-jam_heading').text[/[\d]+/]
        count = channels_list.count
        addon_list << [addon_category, channels_list, count, cost]
    end
    
    addon_list
end


def get_packages_local_att
    html_doc = Nokogiri::HTML(File.read("scraping/att.html"))
    
    packages_list = []
    
    plus_cost = html_doc.css('div#plus-info').css('div.price').text[/[\d]+/]
    plus_channels = html_doc.css('div.plus-images').css('img').map do |channel|
        channel['src'].scan(/.+\/([a-zA-Z]+).png/)
    end
    plus_channels = plus_channels.uniq
    plus_count = plus_channels.count
    packages_list << ["PLUS", plus_channels, plus_count, plus_cost]
    
    
    max_cost = html_doc.css('div#max-info').css('div.price').text[/[\d]+/]
    max_channels = html_doc.css('div.max-images').css('img').map do |channel|
        channel['src'].scan(/.+\/([a-zA-Z]+).png/)
    end
    max_channels = max_channels.uniq
    max_count = max_channels.count
    packages_list << ["MAX", max_channels, max_count, max_cost]
    
    packages_list
end


def get_packages_local_youtube
    html_doc = Nokogiri::HTML(File.read("scraping/youtube.html"))
    
    channels_list = html_doc.css('div.zip__network').map do |channel|
        channel.css('p').text
    end
    
    price = html_doc.css('span.price').text[/[\d]+[,.][\d]+/]
    
    [["Youtube TV", channels_list, channels_list.count, price]]
end


class ScrapersController < ApplicationController
    def select_package
    end
    
    def show_package
        if params[:service] == "sling"
            @addons = get_addons_local_sling
            @packages = get_packages_local_sling
        elsif params[:service] == "att"
            @packages = get_packages_local_att
        elsif params[:service] == "youtube" 
            @packages = get_packages_local_youtube
        end
    end
end
