class FavoController < ApplicationController
  def create
      favo = current_user.favos.create(picture_id: params[:picture_id])
      redirect_to pictures_url, notice: "お気に入りに登録しました"
  end
  
  def destroy
      favo = current_user.favos.find_by(id: params[:id]).destroy
      redirect_to pictures_url, notice: "お気に入り解除しました"
  end
end
