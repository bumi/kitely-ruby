require 'http'
module Kitely
  class Order

    attr_accessor :jobs, :customer

    def initialize(customer:)
      self.customer = customer
      self.jobs = []
      yield jobs if block_given?
    end

    def add(job)
      self.jobs.push(job)
    end

    def attributes
      {
        shipping_address: self.customer.shipping_address,
        customer_phone: self.customer.phone,
        customer_email: self.customer.email,
        jobs: self.jobs.map(&:attributes)
      }
    end

    def order!
      self.http.post(Kitely.url('print'), json: self.attributes)
    end

    def http
      @http ||= HTTP.auth("ApiKey #{Kitely.public_key}:#{Kitely.secret_key}")
    end
  end
end
