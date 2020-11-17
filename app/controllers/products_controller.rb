class ProductsController < ApplicationController
  before_action :initialize_session
  before_action :increment_visit_count, only: %i[index]

  def index
    @products = Product.all

    session[:visit_count] ||= 0
    session[:visit_count] += 1
    @visit_count = session[:visit_count]
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    session[:cart] << params[:id] # Gets id from routes
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
