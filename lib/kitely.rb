require "kitely/version"

require 'kitely/customer'
require 'kitely/order'
require 'kitely/photobook'

module Kitely
  class Error < StandardError; end
  BASE_URL = 'https://api.kite.ly/v4.0/'

  def self.secret_key=(key)
    @secret_key = key
  end
  def self.secret_key
    @secret_key
  end

  def self.public_key=(key)
    @public_key = key
  end
  def self.public_key
    @public_key
  end

  def self.url(path)
    "#{BASE_URL}#{path}"
  end
end
