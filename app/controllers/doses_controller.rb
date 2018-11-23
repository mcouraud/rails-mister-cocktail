class DosesController < ApplicationController
  def create
    @dose = Dose.new(doses_params)
    @dose.cocktail = Cocktail.find(params[:cocktail_id])
    if @dose.save
      redirect_to cocktail_path(@dose.cocktail)
    else
      render :new
    end
  end

  def destroy
    set_doses
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def set_doses
     @dose = Dose.find(params[:id])
  end

  def doses_params
     params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end
end
