require 'share-counter/common'
require 'nokogiri'
require 'open-uri'

class ShareCounter

  # network lookups

  def self.reddit url
    html = make_request "http://www.reddit.com/api/info.json", url: url
    j = JSON.parse(html)

    unless j['data']['children'].empty?
      return j['data']['children'][0]['data']['score']
    else
      return 0
    end
  end

  def self.twitter url
    html = make_request "http://urls.api.twitter.com/1/urls/count.json",  url: url
    return JSON.parse(html)['count']
  end

  def self.facebook url
    html = make_request "https://api.facebook.com/method/fql.query", format: "json", query: "select like_count from link_stat where url=\"#{url}\""
    return JSON.parse(html)[0]['like_count']
  end

  def self.linkedin url
    html = make_request "http://www.linkedin.com/countserv/count/share", url: url, callback: "IN.Tags.Share.handleCount"
    return JSON.parse(html)['count']
  end

  def self.googleplus url
    html = make_request "https://plusone.google.com/_/+1/fastbutton", url: url
    return Nokogiri::HTML.parse(html).xpath('//*[@id="aggregateCount"]').text.to_i
  end

  def self.delicious url
    html = make_request "http://feeds.delicious.com/v2/json/urlinfo/data", url: url
    puts html
    # return Nokogiri::HTML.parse(html).xpath('//*[@id="aggregateCount"]').text.to_i
  end

  def self.stumbleupon url
    html = make_request "http://www.stumbleupon.com/services/1.01/badge.getinfo", url: url
    puts html
    # return Nokogiri::HTML.parse(html).xpath('//*[@id="aggregateCount"]').text.to_i
  end

  def self.pinterest url
    html = make_request "http://widgets.pinterest.com/v1/urls/count.json", url: url, source: 6
    puts html
    # return Nokogiri::HTML.parse(html).xpath('//*[@id="aggregateCount"]').text.to_i
  end


  # helpers - get all or selected networks

  def self.supported_networks
    %w(reddit twitter facebook linkedin googleplus)
  end

  def self.all url
    supported_networks.inject({}) { |r, c| r[c.to_sym] = ShareCounter.send(c, url); r }
  end

  def self.selected url, selections
    selections.map{|name| name.downcase}.select{|name| supported_networks.include? name.to_s}.inject({}) {
       |r, c| r[c.to_sym] = ShareCounter.send(c, url); r }
  end

end


# tests, lol. they all pass.

# url = "http://makeshift.io/"
# puts ShareCounter.all url
# puts ShareCounter.selected url, [:linkedin, :facebook]

# puts ShareCounter.linkedin url
# puts ShareCounter.googleplus url
# puts ShareCounter.twitter url
# puts ShareCounter.facebook url
# puts ShareCounter.reddit url
# puts ShareCounter.delicious url
# puts ShareCounter.stumbleupon url
# puts ShareCounter.pinterest url
