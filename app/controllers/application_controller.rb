class ApplicationController < ActionController::Base
    before_action :build_navbar
    
    protected
    def build_navbar
        @agences_nav = Agence.all
    end
end
