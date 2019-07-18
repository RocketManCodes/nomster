class Photo < ApplicationRecord
  belongs_to :user
  belongs_to :place
  mount_uploader :picture, PictureUploader

  def create
    @photo = Photo.find(params[:place_id])
    @place.photo.create(photo_params.merge(user: current_user))
    redirect_to place_photos_path(@place)
  end

    private

  def comment_params
    params.require(:photo).permit(:message, :rating)

    rails g migration add_picture_to_photo picture:string 
    rails db:migrate
  

  end
end

