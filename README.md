[![Gem Version](https://badge.fury.io/rb/share-counter.png)](http://badge.fury.io/rb/share-counter)

# ShareCounter


Returns the Twitter, Facebook, LinkedIn, Google+ and Reddit shares for a link.

Listed on [RubyGems](http://rubygems.org/gems/share-counter)


## Installation

```
gem install share-counter
```


## Usage

```ruby
2.0.0p353 :001 > require 'share-counter'
2.0.0p353 :002 > url = 'http://makeshift.io'

# get all
2.0.0p353 :003 > counts = ShareCounter.all url
 => {:reddit=>0, :twitter=>108, :facebook=>5, :linkedin=>26, :googleplus=>29}

# get specific networks
2.0.0p353 :004 > counts = ShareCounter.selected url, [:facebook, :linkedin]
 => {:facebook=>5, :linkedin=>26}
 
# get one network
2.0.0p353 :005 > ShareCounter.googleplus url
29
```
