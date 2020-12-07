class ApplicationController < ActionController::Base
    #layout "ajay"
    before_action :authenticate_user!
end
