class IpCheckController < ApplicationController
  
  def index
  end

  def search
    @data = {}
    ip_address = params[:ipaddress]
    
    @data[:ipaddress] = ip_address["ipaddress"]
    
    @data[:details] = get_ip(ip_address[:ipaddress])
    
    respond_to do |format|
      format.js
    end
  end

  def view
  end
end
