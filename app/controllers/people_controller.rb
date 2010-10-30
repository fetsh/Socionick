class PeopleController < ApplicationController

  before_filter :authenticate_user!
  load_and_authorize_resource :except => [:unanswered, :rss]

  def rss
    @people = Person.all
    respond_to do |format|
      format.atom 
    end
  end

  def index
    @stypes = Stype.find(:all)
    @people = params[:user_id].nil? ? Person.all(:include => [:user, :answers]) : User.find_by_id(params[:user_id]).people
    respond_to do |format|
      format.json { render :json => @people }
      format.xml  { render :xml => @people }
      format.atom 
      format.html
    end
    #@people = Person.all(:include => [:user, :answers])
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
    authorize! :read, Person
    render :index
  end


end
