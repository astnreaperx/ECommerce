class ProductsController < ApplicationController
  before_action :increment_visit_count, only: %i[index]
  before_action :load_cart

  def index
    @products = if params[:search]
      Product.search(params[:search]).order("name ASC").page params[:page]
    else
      Product.order("id ASC").page params[:page]
    end
    session[:visit_count] ||= 0
    session[:visit_count] += 1
    @visit_count = session[:visit_count]
  end

  def show
    @product = Product.find(params[:id])
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

  def increment_visit_count
    session[:visit_count] +=1
    @visit_count = session[:visit_count]
  end
end
