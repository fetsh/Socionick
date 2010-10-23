class PeopleController < ApplicationController

  before_filter :authenticate_user!
  load_and_authorize_resource

  def index
    @stypes = Stype.find(:all)
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    
    if @person.save
      flash[:success] = 'Ок, пусть теперь отвечают.'
      redirect_to people_path
    else
      render :new
    end
      
  end

  def update
    if @person.update_attributes(params[:person])
      flash[:success] = 'Ок, пусть теперь отвечают.'
      redirect_to people_path
    else
      render :index
    end
  end

  def destroy
    @person.destroy
    redirect_to people_path
  end

end
