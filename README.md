[![Gem Version](https://badge.fury.io/rb/share-counter.png)](http://badge.fury.io/rb/share-counter)
[![Code Climate](https://codeclimate.com/github/ollieglass/share-counter/badges/gpa.svg)](https://codeclimate.com/github/ollieglass/share-counter)
[![Test Coverage](https://codeclimate.com/github/ollieglass/share-counter/badges/coverage.svg)](https://codeclimate.com/github/ollieglass/share-counter)
[![Build Status](https://travis-ci.org/ollieglass/share-counter.svg?branch=master)](https://travis-ci.org/ollieglass/share-counter)
[![Dependency Status](https://gemnasium.com/ollieglass/share-counter.svg)](https://gemnasium.com/ollieglass/share-counter)

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

Issue reports, feature requests and pull requests welcome.

Spiritual successor to the [Share Counts](https://github.com/vitobotta/share_counts) gem.


## Installation

```
gem install share-counter
```


## Usage

```ruby

2.1.1 :001 > require 'share-counter'
2.1.1 :002 > url = 'http://rinse.fm'

# get all
2.1.1 :003 > counts = ShareCounter.all url
 => {:reddit=>9, :twitter=>25042, :facebook=>37699, :linkedin=>154, :googleplus=>1, :delicious=>-1, :stumbleupon=>2087, :pinterest=>0}

# note delicious count. -1 means an error prevented the count being retrieved

# get specific networks
2.1.1 :004 > counts = ShareCounter.selected url, [:facebook, :linkedin]
 => {:facebook=>37699, :linkedin=>154}

# get one network
2.1.1 :005 > ShareCounter.twitter url
 => 25042
```
