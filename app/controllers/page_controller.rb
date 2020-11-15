class PageController < ApplicationController
  def index
    @products = if params[:search]
                  Product.search(params[:search]).order("name ASC").page params[:page]
                else
                  Product.order("id ASC").page params[:page]
                end

    @woodworkers = if params[:search]
                     Woodworker.search(params[:search]).order("id ASC").page params[:page]
                   else
                     Woodworker.order("id ASC").page params[:page]
                   end
  end
end
