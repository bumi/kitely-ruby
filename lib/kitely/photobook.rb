module Kitely
  class Photobook
    attr_accessor :template_id, :front_cover, :back_cover, :pages

    def initialize(options = {})
      self.template_id = options[:template] || 'photobook_wrap_21x21_square'
      self.pages = []
    end

    def add_page(page)
      if page.is_a?(String)
        page = { asset: page }
      end
      self.pages << { layout: 'single_centered' }.merge(page)
    end

    def attributes
      {
        template_id: self.template_id,
        assets: {
          front_cover: self.front_cover,
          back_cover: self.back_cover,
          pages: self.pages
        }
      }
    end
  end
end
