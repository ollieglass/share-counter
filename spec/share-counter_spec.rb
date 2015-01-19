require 'spec_helper'

describe ShareCounter do
  let(:url) { "http://rinse.fm/"}

  it 'looks up shares on each network' do
    ShareCounter.supported_networks.each do |network|
      puts "Looking up network: #{network}"
      puts "Shares: #{ShareCounter.send(network, url)}"
    end
  end
end

