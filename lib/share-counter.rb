class ShareCounter

  # require 'share-counter/common'

  # require 'json'
  require 'rest-client'
  require 'nokogiri'
  require 'open-uri'

  def self.twitter url
    url = "http://urls.api.twitter.com/1/urls/count.json?url=" + URI::encode(url)
    html = RestClient.get url
    return JSON.parse(html)['count']
  end

  def self.facebook url
    url = 'https://api.facebook.com/method/fql.query?format=json&query=select like_count from link_stat where url="' + url + '"'
    url = URI::encode(url)
    html = RestClient.get url
    return JSON.parse(html)[0]['like_count']
  end

  def self.linkedin url
    url = "http://www.linkedin.com/countserv/count/share?url=" + URI::encode(url)
    html = RestClient.get url

    callback = "IN.Tags.Share.handleCount"
    html = html.gsub(/\A\/\*\*\/\s+/, "").gsub(/^(.*);+\n*$/, "\\1").gsub(/^#{callback}\((.*)\)$/, "\\1")
    return JSON.parse(html)['count']
  end

  def self.googleplus url
    begin
      url = "https://plusone.google.com/_/+1/fastbutton?url=" + URI::encode(url)
      html = RestClient.get url
      return Nokogiri::HTML.parse(html).xpath('//*[@id="aggregateCount"]').text.to_i
    rescue Exception => e
      puts e
    end
  end

  # def self.all url
  #   supported_networks.inject({}) { |r, c| r[c.to_sym] = ShareCounts.send(c, url); r }
  # end

  # def self.selected url, selections
  #   selections.map{|name| name.downcase}.select{|name| supported_networks.include? name.to_s}.inject({}) {
  #      |r, c| r[c.to_sym] = ShareCounts.send(c, url); r }
  # end

end


# url = "http://makeshift.io/"
# puts ShareCounter.googleplus url
# puts ShareCounter.linkedin url
# puts ShareCounter.twitter url
# puts ShareCounter.facebook url


