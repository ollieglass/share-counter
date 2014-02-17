[![Gem Version](https://badge.fury.io/rb/share-counter.png)](http://badge.fury.io/rb/share-counter)

# ShareCounter


Returns the number of shares for a link from

* Twitter
* Facebook
* LinkedIn
* Google+
* Reddit
* Delicious
* StumbleUpon
* Pinterest

Listed on [RubyGems](http://rubygems.org/gems/share-counter)

Issue reports and pull requests welcome.

Spiritual successor to the [Share Counts](https://github.com/vitobotta/share_counts) gem.


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
