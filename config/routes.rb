Rails.application.routes.draw do
  # SEARCH ACTION WILL HANDLE THE GET/POST REQUEST
  # TO WEATHER/SEARCH URL PATH
  get 'weather/search', as: 'search'
  post 'weather/search', to: 'weather#search'
  # ROOT PATH IS MAPPED TO SEARCH ACTION
  root 'weather#search'
end
