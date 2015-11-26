module IpCheckHelper
  def get_ip(ip)
    data = $redis.lindex("#{ip}", -1)
    
    if data.is_a? String
      JSON.parse(data)
    else
      { :result => "Not Listed" }
    end
  end

  def latest
    s = $helper.get("fsc")
    alert_data = []
    old_keys = (JSON.parse(s) if s.is_a? String) || []
    
    keys = $helper.keys.select {|x| x if !x.eql?("fsc") }
    new_keys =  keys - old_keys
    new_keys.each_index do |i|
      ns, ip = new_keys[i].split(":")
      alert_data << $redis.lindex("#{ip}", -1)
    end
    $helper.set("fsc", keys.to_json) if !new_keys.empty?
    alert_data
  end
end
