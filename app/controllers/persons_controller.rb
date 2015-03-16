class PersonsController < ApplicationController

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)
    if @person.save
      flash[:notice] = "#{@person.full_name} was successfully added!"
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @person = Person.find(params[:id])
  end

  def edit
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.find(params[:id])
    if @person.update(person_params)
      flash[:notice] = 'Person was updated!'
      redirect_to person_path(@person)
    else
      render :edit
    end
  end

  def destroy
    person = Person.find(params[:id])
    person.destroy
    flash[:notice] = "#{person.full_name} has been killed!"
    redirect_to root_path
  end

  private

  def person_params
    params.require(:person).permit(:first_name, :last_name, :occupation)
  end
end
