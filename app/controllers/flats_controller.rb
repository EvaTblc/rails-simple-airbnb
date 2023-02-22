class FlatsController < ApplicationController
  before_action :set_flats, only: %i[show update destroy edit]
  def index
    @flats = Flat.all
  end

  def show; end

  def new
    @flat = Flat.new
  end

  def edit; end

  def destroy
    @flat.destroy
    redirect_to flats_path
  end

  def update
    if @flat.update(params_flat)
      redirect_to flat_path(@flat)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @flat = Flat.new(params_flat)
    if @flat.save
      redirect_to flats_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_flats
    @flat = Flat.find(params[:id])
  end

  def params_flat
    params.require(:flat).permit(:name, :address, :price_per_night, :number_of_guests, :description)
  end
end
