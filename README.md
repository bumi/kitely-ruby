# Kitely

Ruby API wrapper for [kite.ly](https://www.kite.ly) - the print on demand service


This is a prototype, pull requests welcome.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'kitely'
```

Or install it yourself as:

    $ gem install kitely

## Usage

```ruby

Kitely.secret_key = 'xxxx'
Kitely.public_key = 'yyyy'

book = Kitely::Photobook.new
book.front_cover = 'https://s3.amazonaws.com/sdk-static/TestImages/1.png'
book.back_cover = 'https://s3.amazonaws.com/sdk-static/TestImages/1.png'

[].each do |photo_url|
  book.add_page(photo_url)
end

customer = Kitely::Customer.new
customer.shipping_address = {recipient_name: 'Joe Kite'}
customer.phone = '+4917012345678'
customer.email = 'joe@example.com'

order = Kitely::Order.new(customer: customer)
oder.add(book)

response = order.order!
puts response.body.to_s

```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
