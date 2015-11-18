module IpCheckHelper
  
  def get_ip(ip)
    data = $redis.lindex("#{ip}", -1)
    
    if data.is_a? String
      JSON.parse(data)
    else
      { :result => "Not Listed" }
    end
  end
end
