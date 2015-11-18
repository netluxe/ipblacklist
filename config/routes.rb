Rails.application.routes.draw do
  root 'ip_check#index'
  post "search" => "ip_check#search"
  get "view" => "ip_check#view"
end
