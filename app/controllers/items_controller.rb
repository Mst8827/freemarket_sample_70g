class ItemsController < ApplicationController


  def index
  end

  def new
    @item = Item.new
    @item.images.new
    # @parents = Category.all.order("id ASC").limit(13)
    @category = Category.all.order("ancestry ASC").limit(13)
  end

  def create
    @item = Item.new(item_params)
    # @brand = Brand.create
    # binding.pry

    if @item.save
      redirect_to root_path
    else
      render :new
    end  
  end

  def confirm
  end
  
  def show
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

  private
  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :brand_name, :size, :condition,
                                  :shipping_fee_payer, :shipping_location, :shipping_days, :price,
                                  images_attributes: [:image], categories_attributes: [:name]).merge(user_id: 1)
  end

end
  