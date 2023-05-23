Rails.application.routes.draw do
get 'weather/search', as: 'search'
post 'weather/search', to: 'weather#search'
root 'weather#serch'
end
