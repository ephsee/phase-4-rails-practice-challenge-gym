class ClientsController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

    def index

        clients = Client.all
        render json: clients

    end

    def show
        client = Client.find(params[:id])
        render json: client
    
    end

    def update
    
        client = Client.find(params[:id])
        client.update(client_params)
        render json: client
    
    end

    private

    def render_not_found(banana)
        
        render json: {banana: "#{banana.model} Not Found"}, status: :not_found
    
    end

    def client_params
    
        params.permit(:name, :age)
    
    end

end
