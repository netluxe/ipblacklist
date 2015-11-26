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

  def livefeed
  end

  def frag
    @latest_blocks = latest

    respond_to do |format|
      format.json { render :json => @latest_blocks.to_json }
    end
  end
end
