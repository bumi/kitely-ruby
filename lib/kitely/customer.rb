module Kitely
  class Customer
    attr_accessor :shipping_address, :phone, :email

    def initialize(details = {})
      self.shipping_address = details[:shipping_address]
      self.phone = details[:phone]
      self.email = details[:email]
    end

  end
end
