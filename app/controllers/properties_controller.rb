class PropertiesController < ApplicationController 
    before_action :authorize_request  
    before_action :set_property, only: %i[show update destroy]
  
    def index
        @properties = Property.all
        render json: @properties, status: :ok
    end
  
    def show
      render json: @property, status: :ok, data: {PropertySerializer.new(@property)}
    end
  
    def create
      @property = Property.new(property_params)
      @property.user = @current_user 

  
      if @property.save
        render json: @property, status: :created
      else
        render json: { errors: @property.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def update
      if @property.update(property_params)
        render json: @property
      else
        render json: { errors: @property.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def destroy
      @property.destroy
      head :no_content
    end
    
    def get_property
        @user = User.find(params[:user_id])
        @properties = @user.properties
        render json: @properties, status: :ok
    end

    private
  
    def set_property
      @property = Property.find(params[:id])
    end
  
    def property_params
      params.require(:property).permit(:name, :city, :country, :price, :status, :year)
    end
end
  