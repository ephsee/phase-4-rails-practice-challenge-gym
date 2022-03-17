class MembershipsController < ApplicationController

    def index

        memberships = Membership.all
        render json: memberships

    end

    def create
        membership = Membership.create(membership_params)
        render json: membership, status: :created
    end

    private

    def membership_params
    
        params.permit(:charge, :client_id, :gym_id)
    
    end


end
