class AbductionsController < ApplicationController

  def index
    @alien = Alien.find(params[:alien_id])
    @abductions = @alien.abductions
  end

  def new
    @alien = Alien.find(params[:alien_id])
    @abduction = Abduction.new
  end

  def create
    @alien = Alien.find(params[:alien_id])
    @abduction = Abduction.new(abduction_params.merge(alien_id: @alien.id))
    if @abduction.save
      flash[:notice] = "#{@alien.species} abducted #{@abduction.person.full_name}!"
      redirect_to alien_abductions_path(@alien)
    else
      render :new
    end
  end

  def show
    @alien = Alien.find(params[:alien_id])
    @abduction = @alien.abductions.find(params[:id])
  end

  def edit
    @alien = Alien.find(params[:alien_id])
    @abduction = @alien.abductions.find(params[:id])
  end

  def update
    @alien = Alien.find(params[:alien_id])
    @abduction = @alien.abductions.find(params[:id])
    if @abduction.update(abduction_params.merge(alien_id: @alien.id))
      flash[:notice] = 'Abduction was updated!'
      redirect_to alien_abduction_path(@alien, @abduction)
    else
      render :edit
    end
  end

  def destroy
    @alien = Alien.find(params[:alien_id])
    @alien.abductions.find(params[:id]).destroy
    flash[:notice] = 'Forget this ever happened!'
    redirect_to alien_abductions_path(@alien)
  end


  private

  def abduction_params
    params.require(:abduction).permit(:alien_id, :person_id, :date, :anal_probe)
  end


end
