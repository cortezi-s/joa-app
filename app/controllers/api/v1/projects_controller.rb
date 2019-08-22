module Api
  module V1
    class ProjectsController < ApplicationController
      before_action :authenticate_user!, except: [:index, :show]
      before_action :set_project, only: [:show, :update, :destroy]

      # GET /projects
      def index
        @projects = Project.all.order(position: :asc).with_attached_hero_image

        render json: @projects.map { |project|
          image_url = project.hero_image.present? ? rails_blob_path(project.hero_image) : nil
          project.as_json.merge({ image: image_url })
        }
      end

      # GET /projects/1
      def show
        render json: @project
      end

      # POST /projects
      def create
        @project = Project.new(project_params)

        if @project.save
          render json: @project, status: :created, location: api_v1_project_url(@project)
        else
          render json: @project.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /projects/1
      def update
        if @project.update(project_params)
          render json: @project
        else
          render json: @project.errors, status: :unprocessable_entity
        end
      end

      # DELETE /projects/1
      def destroy
        @project.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_project
          @project = Project.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def project_params
          params.require(:project).permit(:company_name, :date, :description, :founders, :linkedin,
                                          :facebook, :twitter, :instagram, :homepage, :location, :hero_image, :team_image)
        end
    end
  end
end
