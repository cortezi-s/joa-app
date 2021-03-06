module Api
  module V1
    module Admin
      class ProjectsController < ApplicationController
        before_action :authenticate_user!
        before_action :set_project, only: [:show, :update, :destroy]

        # GET /projects
        def index
          @projects = Project.all.order(position: :asc)

          render json: @projects
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
                                            :facebook, :twitter, :instagram, :homepage, :location, :position,
                                            :hero_image, :team_image)
          end
      end
    end
  end
end
