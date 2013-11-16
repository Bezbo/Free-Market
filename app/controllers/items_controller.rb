class ItemsController < ApplicationController

  before_filter :authorize, except: [:index, :show]
  load_and_authorize_resource

  def index
    if params[:tag]
      @items = Item.tagged_with(params[:tag])
    else
      @items = Item.all
    end
  end

  def show
  end

  def new 
  end

  def edit
  end

  def create
    @item.user = current_user
      if @item.save
        redirect_to @item, notice: 'Item was successfully created.'
      else
        render action: "new"
      end
  end

  def update
      if @item.update_attributes(params[:item])
        redirect_to @item, notice: 'Item was successfully updated.'
      else
        render action: "edit" 
      end
  end

  def destroy
    @item.destroy

    redirect_to items_url
  end
end
