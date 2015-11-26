Rails.application.routes.draw do
  root 'ip_check#index'
  post "search" => "ip_check#search"
  get "livefeed" => "ip_check#livefeed"
  get "frag" => "ip_check#frag"
end
