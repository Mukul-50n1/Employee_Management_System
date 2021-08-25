class AddressesController < ApplicationController
  def edit
   
    @address = Address.find(params[:id])

  end

  def update
    @address = Address.find(params[:id])

    @address.update(params.require(:address).permit(:address_types , :country , :city , :state , :street_address))

  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to "/employees/address/#{@address.employee_id}"

  end
end
