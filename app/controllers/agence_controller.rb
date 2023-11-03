class AgenceController < ApplicationController
    before_action :set_agence, only: %i[show]
  
    # Action pour afficher les détails de l'agence
    def show
      find_employes
    end
  
    private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_agence
      begin
        @agence = Agence.find(params[:id])
      rescue => e
        redirect_to root_path
      end
    end
  
    def find_employes
      @employes = Employe.where(agence_id: @agence.id)
    end
  end
  
  