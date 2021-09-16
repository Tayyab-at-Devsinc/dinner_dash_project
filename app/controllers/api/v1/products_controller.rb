module Api
  module V1
    class ProductsController < ApiController
      def index
        @products = Product.all
      end

      def create

      end
      def show
        @product = Product.find(params[:id])
      end
    end
  end
end

