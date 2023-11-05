class AccueilController < ApplicationController
  def index
    @ip_locale = ENV['IP_HOTE'] || recup_iplocale
    @agence_locale = determiner_agence_locale(@ip_locale)
    @agences = Agence.all
  end

  protected

  def recup_iplocale
    require 'socket'
    ip_address = Socket.ip_address_list.detect { |intf| intf.ipv4_private? }
    if ip_address
      local_ip = ip_address.ip_address
      return local_ip
    else
      return ''
    end
  end

  def determiner_agence_locale(ip)
    case ip
    when /^172\.16\.1\./
      Agence.find_by(nom: 'Anvers')
    when /^172\.16\.2\./
      Agence.find_by(nom: 'Barcelone')
    when /^172\.16\.3\./
      Agence.find_by(nom: 'Californie')
    when /^172\.16\.4\./
      Agence.find_by(nom: 'Dortmund')
    when /^172\.16\.5\./
      Agence.find_by(nom: 'Edimbourg')
    when /^172\.16\.6\./
      Agence.find_by(nom: 'Frankfurt')
    when /^172\.16\.7\./
      Agence.find_by(nom: 'Galway')
    when /^172\.16\.8\./
      Agence.find_by(nom: 'Hong-Kong')
    when /^172\.16\.250\./
      Agence.where("nom LIKE ?", "%siège%").first
    else
      nil # Renvoie nil si aucune correspondance n'est trouvée
    end
  end
  
end

