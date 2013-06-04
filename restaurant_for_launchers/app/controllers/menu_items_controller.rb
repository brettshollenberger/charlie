class MenuItemsController < ApplicationController
  def new
    @menu_item = MenuItem.new
  end

  def create
    @menu_item = MenuItem.new(params[:menu_item])
    @menu_item.save
    redirect_to menu_items_path
  end

  def index
    @menu_items = MenuItem.all
  end
end
