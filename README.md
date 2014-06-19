# require_date

Easily require date arguments for command line apps.  Includes some
formats by default but can have custom regexp set.  Pass a block to
override raising an argument error if the fetch fails.

## Installation

Add this line to your application's Gemfile:

    gem 'require_date'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install 'require_date'

## Usage
    
    $  ruby run.rb 20140101 20141212 2014-01


```ruby
require 'rubygems' # Needed if using Ruby 1.8.7
require 'require_date'
    
# Default RegExp is RequireDate.FORMATS[:date]
# The following hash is equal to RequireDate.FORMATS
# {
#  :date => Regexp.union(/\A(\d{4})-(\d{2})-(\d{2})\z/, /\A(\d{4})(\d{2})(\d{2})\z/),
#  :month_group => Regexp.union(/\A(\d{4})-(\d{2})\z/, /\A(\d{4})(\d{2})\z/)
# }
   
# Pull the first argument that matches the default RegExp
# Will raise an Argument error if nothing is foun
@start = RequireDate.try_parse(RequireDate.next)
  
# Pull the next argument that matches the default RegExp
# The block overrides the raise and sets the value to today
@end = RequireDate.try_parse(RequireDate.next { @start + 1 })
    
# Pull the next argument that matches the given RegExp
# We do not run this through RequireDate.try_parse since it isn't
# a complete date, just a reference point we can use
@month_group = RequireDate.next(RequireDate::FORMATS[:month_group])
    
# Results
@start # => #<Date: 4913317/2,0,2299161>
@end # => #<Date: 4914007/2,0,2299161>
@month_group # => "2014-01"
```


## Contributing

1. Fork it ( https://github.com/kthibodeaux/require_date/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
