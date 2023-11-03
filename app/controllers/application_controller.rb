class ApplicationController < ActionController::Base
    before_action :build_navbar
    
    protected
    def build_navbar
        @agences = Agence.all
    end
end
