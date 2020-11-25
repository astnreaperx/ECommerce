class PageController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :initialize_session
  before_action :load_cart

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

    @recent_products = Product.last(5)
  end

  def about
    @owner = Owner.last
  end

  def add_to_cart
    id = params[:id].to_i
    session[:cart] << id unless session[:cart].include?(id)
    redirect_to root_path
  end

  def load_cart
    @cart = Product.find(session[:cart])
  end

  def remove_from_cart
    id = params[:id].to_i
    session[:cart].delete(id)
    redirect_to root_path
  end

  def initialize_session
    session[:visit_count] ||= 0
    session[:cart] ||= []
  end
end
