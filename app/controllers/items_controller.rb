class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update]
  before_action :set_user, only: [:edit, :update]

  def index
    @items = Item.includes(:images).order(:item_purchaser_id, "id DESC")
    @category = Category.all.order("ancestry ASC").limit(13)
    @parents = Category.where(ancestry:nil)
  end

  def new
    @item = Item.new
    @item.images.new
    @category = Category.all.order("ancestry ASC").limit(13)
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      @item.images.build
      @category = Category.all.order("ancestry ASC").limit(13)
      render :new
    end
  end

  def confirm
    @item = Item.includes(:user).find(params[:id])
    @items = @item.images
    @location = current_user.location
  end
  
  def show
    @item = Item.includes(:user).find(params[:id])
    @comment = Comment.new
    @comments = @item.comments.includes(:user).order("id DESC")
    @category = Category.all.order("ancestry ASC").limit(13)
    @parents = Category.where(ancestry:nil)
    @items = Item.includes(:images).order(:item_purchaser_id, "id DESC")
  end

  def category_children
    @category_children = Category.find(params[:productcategory]).children
    end

  # Ajax通信で送られてきたデータをparamsで受け取り､childrenで子を取得
  def category_grandchildren
    @category_grandchildren = Category.find(params[:productcategory]).children
  end

  def search
    respond_to do |format|
      format.html
      format.json do
        @children = Category.find(params[:parent_id]).children
        #親ボックスのidから子ボックスのidの配列を作成してインスタンス変数で定義
      end
    end
  end

  def edit
    @category = Category.all.order("ancestry ASC").limit(13)
    @selected_grandchild_category = @item.category
    @selected_child_category = @selected_grandchild_category.parent
    @selected_parent_category = @selected_child_category.parent
  end

  def update
    @item.update(item_params)
      redirect_to item_path(@item.id)
    # else
    #   render :edit
    # end
  end

  def destroy
    item = Item.find(params[:id])
    redirect_to user_path(current_user.id) and return unless item.destroy
    redirect_to onsale_user_path(current_user.id)
  end

  def search
    @items = Item.search(params[:keyword])
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :brand_name, :size, :condition,
                                  :shipping_fee_payer,:prefecture_id, :shipping_days, :price,
                                  images_attributes: [:image, :_destroy, :id], categories_attributes: [:name]).merge(user_id: current_user.id)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def set_item
    @item = Item.includes(:user).find(params[:id])
  end

  def user_params
    params.require(:item).permit(user:[:nickname])
  end
end