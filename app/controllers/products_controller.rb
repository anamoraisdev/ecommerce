class ProductsController < ApplicationController
    before_action :authenticate_user!

    def index
        products = Product.all
        return render json: products
    end
end
