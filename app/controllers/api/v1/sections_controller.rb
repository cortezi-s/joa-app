module Api
  module V1
    class SectionsController < ApplicationController
      before_action :set_section, only: [:show, :update, :destroy]

      # GET /sections
      def index
        @sections = Section.all

        render json: @sections
      end

      # GET /sections/:name
      def show
        render json: @section
      end

      # POST /sections
      def create
        @section = Section.new(section_params)

        if @section.save
          render json: @section, status: :created, location: @section
        else
          render json: @section.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /sections/:name
      def update
        if @section.update(section_params)
          render json: @section
        else
          render json: @section.errors, status: :unprocessable_entity
        end
      end

      # DELETE /sections/:name
      def destroy
        @section.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_section
          @section = Section.find_by!(name: params[:name])
        end

        # Only allow a trusted parameter "white list" through.
        def section_params
          params.require(:section).permit(:title, :content)
        end
    end
  end
end
