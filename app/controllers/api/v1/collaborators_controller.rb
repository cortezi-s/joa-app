module Api
  module V1
    class CollaboratorsController < ApplicationController
      before_action :authenticate_user!, except: [:index, :show]
      before_action :set_collaborator, only: [:show, :update, :destroy]

      # GET /collaborators
      def index
        @collaborators = Collaborator.all.order(position: :asc)

        render json: @collaborators
      end

      # GET /collaborators/1
      def show
        render json: @collaborator
      end

      # POST /collaborators
      def create
        @collaborator = Collaborator.new(collaborator_params)

        if @collaborator.save
          render json: @collaborator, status: :created, location: api_v1_collaborator_url(@collaborator)
        else
          render json: @collaborator.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /collaborators/1
      def update
        if @collaborator.update(collaborator_params)
          render json: @collaborator
        else
          render json: @collaborator.errors, status: :unprocessable_entity
        end
      end

      # DELETE /collaborators/1
      def destroy
        @collaborator.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_collaborator
          @collaborator = Collaborator.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def collaborator_params
          params.require(:collaborator).permit(:name, :role, :linkedin, :message, :image)
        end
    end
  end
end
