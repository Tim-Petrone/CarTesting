class CarsController < ApplicationController

  def index
    if params[:make] == nil || params[:model_year] == nil
      render 'index.html.erb'
    else
      @cars = Car.new(params[:make], params[:model_year])
      session[:cars] = @cars.to_yaml
      redirect_to "/cars/create"
    end
  end

  def create
    @cars = YAML.load(session[:cars])
      if(params.has_key?(:accelerate))
        if @cars.parking_brake == false
          @cars.accelerate
        end
        session[:cars] = @cars.to_yaml
      end
    # @cars = YAML.load(session[:cars])
      if(params.has_key?(:brake))
        @cars.brake
        session[:cars] = @cars.to_yaml
      end
    # @cars = YAML.load(session[:cars])
      if(params.has_key?(:lights_toggle))
        @cars.lights_toggle
        session[:cars] = @cars.to_yaml
      end
    # @cars = YAML.load(session[:cars])
        # @is_checked = ""
      if @cars.speed == 0
        if params[:pb] == "On" && @cars.parking_brake == false
          @cars.brake_toggle
          session[:cars] = @cars.to_yaml
          # @is_checked = "checked"
        elsif params[:pb] == "Off" && @cars.parking_brake == true
          @cars.brake_toggle
          session[:cars] = @cars.to_yaml
          # @is_checked = "checked"
        elsif params[:pb] == nil
        end
      end
      # session[:cars] = @cars.to_yaml
  end

end
