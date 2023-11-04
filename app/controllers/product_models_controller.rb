class ProductModelsController < ApplicationController
    
    def index
        @product_models = ProductModel.all
    end

    def new
        @product_model = ProductModel.new
        @suppliers = Supplier.all
    end
    
    def show
        @product_model = ProductModel.find(params[:id])
    end

    def create  
        @suppliers = Supplier.all      
        product_model_parms = params.require(:product_model).permit(:name,:weight,:height,:width,:depth,:sku,:supplier_id)  
        @product_model = ProductModel.new(product_model_parms)
        if @product_model.save
         flash[:notice] = 'Modelo de produto cadastrado com sucesso.'
         redirect_to @product_model
        else         
         flash[:notice] = 'Não foi possível cadastrar o modelo de produto.'
         render 'new'
        end
    end
end