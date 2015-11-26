$redis = Redis::Namespace.new("cpanel-server", :redis => Redis.new)

$helper = Redis.new
