class AnswersController < ApplicationController
  
  before_filter :authenticate_user!
  
  def create
    @person = Person.find(params[:person_id])
    
    params[:answer][:user_id] = current_user.id
    if @person.answers.any? { |answer| answer.user.id == current_user.id }
      flash[:error] = 'Ты уже определял этого человека'
    else
      @answer = @person.answers.new(params[:answer])
      unauthorized! if cannot? :create, @answer
      respond_to do |format|
        if @answer.save
          format.html { redirect_to people_path }
          format.js
        else
          format.html { redirect_to people_path }
          format.xml  { render :xml => @role.errors, :status => :unprocessable_entity }
        end
      end
    end
  end
  
  def edit
    @stypes = Stype.all
    @person = Person.find(params[:person_id])
    @answer = @person.answers.find(params[:id])
    unauthorized! if cannot? :manage, @answer
    respond_to do |format|
      format.html { redirect_to people_path }
      format.js
    end
  end
  
  def update 
    @person = Person.find(params[:person_id])
    @answer = @person.answers.find(params[:id])
    unauthorized! if cannot? :manage, @answer
    if @answer.update_attributes(params[:answer])
      respond_to do |format|
        format.html { redirect_to people_path }
        format.js
      end
    end
  end
 
end
