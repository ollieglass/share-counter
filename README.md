[![Gem Version](https://badge.fury.io/rb/share-counter.png)](http://badge.fury.io/rb/share-counter)

# ShareCounter


Returns google plus shares for any url

[![I know, rite?](http://gifs.gifbin.com/052011/1304618376_tumbleweed-gif.gif)](http://gifs.gifbin.com/052011/1304618376_tumbleweed-gif.gif)


**Update!** Now returns the Twitter, Facebook, LinkedIn and Reddit shares too. And it's on [RubyGems](http://rubygems.org/gems/share-counter)

[![A small thing in the desert](http://i.imgur.com/j0nCIxj.jpg)


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

## Documentation & feature requests

Sure. This is the wild west.

![wtf](http://i.imgur.com/YJBIGDMs.jpg)

Documentation and feature pull-requests are welcome at the bar, but other than that, it's **tear-driven documentation**, [@ntlk](https://github.com/ntlk)-style.

![tear-driven documentation](http://i.imgur.com/R1a9zVT.png)

We listen to three kinds of tears around here::

* Soft, warm tears of longing and loss
 
If you're missing a feature so bad you're up until 3am playing Billie Holiday records and making Jack Daniel's eye's water, I'll consider *adding new features* to make up for what you're missing.

* Hot, bitter tears of shock and resentment

Your old gem walked out on you for that horse down the road? Won't update to Ruby 2.1.0, they say? Don't need your fancy new city friends? Send a *feature port request* and let's see about that. You were better than them, anyway. 

* Cold, hard tears of misery
 
Pull your head outta the rabbit hole soldier and file a goddamn *issue report*. This town isn't gonna clean itself up.  Bring a shotgun and a shovel.
