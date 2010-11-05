class PhotosController < ApplicationController
  
  before_filter :authenticate_user!
  
  def delete
    @photo = Photo.find(params[:id])
    unauthorized! if cannot? :manage, @photo.person
    @photo.destroy
    respond_to do |format|
      format.js
    end
  end
end
