# Coercer

Use FastAttributes for arbitrary coercions with consistent and DRY logic. Because
life is too short for reimplementing this stuff all over the codebase.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'coercer'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install coercer

## Usage

```ruby
include Coercer::Inclusion

Coerce(nil, String)
```

Available coercions: https://github.com/applift/fast_attributes/blob/master/lib/fast_attributes.rb#L59-L80

Define custom coercions according to the rules for FastAttributes:

https://github.com/applift/fast_attributes#custom-type

For example (adapted from FastAttributes docs):

```ruby
FastAttributes.type_cast String do     # begin
                                       #   case String
  from 'nil',    to: '""'             #   when nil    then nil
  from 'String', to: '%s'              #   when String then %s
  otherwise 'String(%s)'               #   else String(%s) 
                                       #   end
  on_error 'StandardError', act: '""'  # rescue StandardError => e
                                       #   ""
end                                    # end
```

Because expecting a string return value and getting nil is frustrating.

## Contributing

1. Fork it ( https://github.com/zph/coercer/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
