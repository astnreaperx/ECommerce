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

    time = DateTime.now.days_ago(-3).strftime("%B %d, %Y %H:%M")
    @recent_products = Product.where("updated_at > ?", time)
  end

  def about
    @owner = Owner.last
  end
end
