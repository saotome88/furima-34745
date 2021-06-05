class ItemsController < ApplicationController
  def index
  end

  private
  def items_params
    params.require(:items).permit(:name, :descriptionm, :category_id, :condition_id, :delivery_charge_id, :prefecture_id, :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end
end
