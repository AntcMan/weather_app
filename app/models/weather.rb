class Weather < ApplicationRecord
  attr_accessor :city, :temperature, :description, :icon, :feels_like, :humidity, :sunrise, :sunset, :clouds
end
