class AddressesController < ApplicationController
  #before_action :authenticate_employer!
  before_action :find_address , only: [:edit ,:update ,:destroy]

  def edit
  end

  def update
    if @address.update(params_address)
      flash[:notice] = "Your address is updated."
      redirect_to '/'
    else 
      render 'edit'
  end

  def destroy
    @address.destroy
    redirect_to "/employees/"
  end

  private

  def params_address
    params.require(:address).permit(:address_types,:country,:city,:state,:street_address)
  end

  def find_address
     @address = Address.find(params[:id])
   end
end
