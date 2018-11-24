class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update ,:destroy]
  
  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
      if params[:back]
        @picture = Picture.new(picture_params)
        redirect_to '/pictures/new'
      end
  end

  def show
    @favo = current_user.favos.find_by(picture_id: @picture.id)
  end
  
  def create
    @picture = Picture.create(picture_params)
    @picture.user_id = current_user.id
        
      if @picture.save
          #ContactMailer.contact_mail(@picture).deliver
          redirect_to pictures_path, notice: "投稿しました"
      else
          render 'new'
      end
  end

  def destroy
    @picture.destroy
    redirect_to pictures_path, notice:"ブログを削除しました"
  end

  def edit
     if @picture.user_id != current_user.id
      redirect_to  pictures_path, notice: "権限がありません"
     end
  end
  
  def update
    if @picture.update(picture_params)
      redirect_to pictures_path, notice:"投稿を編集しました"
      
    else
      render 'edit'
    end
  end

  def confirm
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id
    render :new if @picture.invalid?
  end
  
  
  private
    def picture_params
        params.require(:picture).permit(:content, :image, :image_cache)
    end
    
    def set_picture
        @picture = Picture.find(params[:id])
    end
end
