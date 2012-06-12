module ActionView
  module Helpers
    def localize(*args) 
      I18n.localize(*args) unless args.first.nil?
    end
    alias l localize
  end
end

module ApplicationHelper

end
