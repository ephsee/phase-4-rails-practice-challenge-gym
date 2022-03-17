class GymsController < ApplicationController


    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

    def index

        gyms = Gym.all
        render json: gyms

    end

    def show

        gym = Gym.find(params[:id])
        render json: gym

    end

    def update
        
        gym = Gym.find(params[:id])
        gym.update(gym_params)
        render json: gym, status: :ok
    
    end

    def destroy
        gym = Gym.find(params[:id])
        gym.destroy
        render json: {}, status: :ok
        # head :no_content, status: :ok
    end

    private

    def render_not_found(banana)
        
        render json: {banana: "#{banana.model} Not Found"}, status: :not_found
    
    end

    def gym_params
    
        params.permit(:name, :address)
    
    end

end
