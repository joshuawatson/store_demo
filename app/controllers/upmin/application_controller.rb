module Upmin
  class ApplicationController < ActionController::Base
    before_filter :is_admin?

    def is_admin?
      authorize! :access_admin, @user
      # raise ActionController::RoutingError.new('Not Found') unless true
    end
  end
end
