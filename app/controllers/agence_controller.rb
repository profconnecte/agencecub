class AgenceController < ApplicationController
    # Action pour afficher les détails de l'agence
    def show
      @agence = Agence.find(params[:id])
    end
  end
  