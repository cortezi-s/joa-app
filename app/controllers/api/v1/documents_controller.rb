module Api
  module V1
    class DocumentsController < ApplicationController
      before_action :set_document, only: [:show]

      # GET /documents
      def index
        @documents = Document.all

        render json: @documents
      end

      # GET /documents/1
      def show
        render json: @document
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_document
          @document = Document.find(params[:id])
        end
    end
  end
end
