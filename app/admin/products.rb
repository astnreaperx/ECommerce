ActiveAdmin.register Product do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :description, :price, :delivery_cost, :woodworker_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :description, :price, :delivery_cost, :woodworker_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  permit_params :name, :description, :price, :delivery_cost, :image, product_categories_attributes: %i[id product_id category_id _destroy]

  form do |f|
    f.semantic_errors(*f.object.errors.keys)

    f.inputs "Product" do
      f.input :name
      f.input :description
      f.input :price
      f.input :delivery_cost
      f.has_many :product_categories, allow_destroy: true do |n_f|
        n_f.input :category
      end
      f.input :image, as: :file
    end
    f.actions
  end
end
