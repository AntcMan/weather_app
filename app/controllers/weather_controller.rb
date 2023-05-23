class WeatherController < ApplicationController

  # GET ACTION
  def search
    city = params[:city]
    response = HTTParty.get("https://api.openweathermap.org/data/2.5/weather?q=#{city}&appid=#{ENV['OPENWEATHER_API_KEY']}&units=metric")
    weather_data = JSON.parse(response.body)

    if weather_data['cod'] == 200 # 'COD' = API RESPONSE CODE OF 200
      @weather = Weather.new( # NEW INSTANCE OF WEATHER MODEL IS CREATED, SAVED TO DB
        city: weather_data['name'],
        # SETS THE TEMPERATURE ATTRIBUTE TO THE VALUE OF THE 'TEMP' FIELD
        # NESTED WITHIN THE 'MAIN' FIELD OF THE API RESPONSE.
        temperature: weather_data['main']['temp'],
        description: weather_data['weather']['description'],
        icon: weather_data['weather'][0]['icon'],
        feels_like: weather_data['main']['feels_like'],
        humidity: weather_data['main']['humidity'],
        sunrise: weather_data['sys']['sunrise'],
        sunset: weather_data['sys']['sunset'],
        clouds: weather_data['clouds']['all']
      )
      @weather.save
    else
      flash[:alert] = 'City not found'
    end

    redirect_to root_path
  end
end
