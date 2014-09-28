module Upmin
  class ApplicationController < ActionController::Base
    before_filter :is_admin?

    def is_admin?
      raise ActionController::RoutingError.new('Not Found') unless true
    end
  end
end
