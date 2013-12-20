class ShareCounter

  # require 'share-counter/common'

  # require 'json'
  require 'rest-client'
  require 'nokogiri'
  require 'open-uri'

  # def self.twitter url, raise_exceptions = false
  #   try("twitter", url, raise_exceptions) {
  #     extract_count from_json( "http://urls.api.twitter.com/1/urls/count.json", :url => url),
  #       :selector => "count"
  #   }
  # end

  # def self.facebook url, raise_exceptions = false
  #   try("facebook", url, raise_exceptions) {
  #     extract_count from_json("http://api.facebook.com/restserver.php", :v => "1.0", :method => "links.getStats",
  #      :urls => url, :callback => "fb_sharepro_render", :format => "json" ), :selector => "total_count"
  #   }
  # end

  # def self.linkedin url, raise_exceptions = false
  #   try("linkedin", url, raise_exceptions) {
  #     extract_count from_json("http://www.linkedin.com/cws/share-count",
  #       :url => url, :callback => "IN.Tags.Share.handleCount" ), :selector => "count"
  #   }
  # end

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
