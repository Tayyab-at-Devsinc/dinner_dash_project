module Api
  module V1
    class LineItemsController < ApiController
      def create
        chosen_product = Product.find(params[:product_id])
        if chosen_product.available
          current_cart = @current_cart
          if current_cart.products.include?(chosen_product)
            @line_item = current_cart.line_items.find_by(:product_id => chosen_product)
            @line_item.quantity += 1
          else
            @line_item = LineItem.new
            @line_item.cart = current_cart
            @line_item.product = chosen_product
            @line_item.quantity = 1
          end
          @line_item.save

        else
          flash[:notice] = 'Product is suspended for sale!!!'
        end
      end


      private
      def line_item_params
        params.require(:line_item).permit(:product_id)
      end
    end
  end
end

