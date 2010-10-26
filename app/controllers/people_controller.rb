class PeopleController < ApplicationController

  before_filter :authenticate_user!
  load_and_authorize_resource :except => :index

  def index
    @stypes = Stype.find(:all)
    params[:show] = "unanswered" unless params[:show].present?
    if params[:show] == "all"
      @people = Person.all(:include => [:user, :answers])
    elsif params[:show] == "unanswered"
      @people = Person.all - current_user.answered_people
    elsif params[:show] == "my"
      @people = current_user.people
    else
      @people = Person.all - current_user.answered_people
    end
  end

  def show
    @stypes = Stype.find(:all)
  end

  def new
  end

  def edit
  end

  def create
    @person.user = current_user
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

  def unanswered
    @people = Person.all - current_user.answered_people
    @stypes = Stype.all
    authorize! :read, @people
    render :index
  end


end
