class OwnDevicesController < ApplicationController
  before_action :logged_in_user, :correct_user


  def show
    if !params[:reset1]

      @all_devices = Device.order(:name)
      @devices = Array.new
      @user.own_devices.each do |own_device|
        @devices << Device.find(own_device.device_id)
      end
    
      @user = User.find(params[:id])
      @own_devices = Array.new
      @user.own_devices.each do |own_device|
        @own_devices << own_device.device_id
      end
    else
      render 'show'
    end
  end
  
  def update_own_device
    user = User.find(params[:id])
    OwnDevice.delete_record(params[:id])
    if params[:items] == nil
      respond_to do |format|
        format.html { redirect_to request.referrer }
      end
    elsif params[:reset1]
      respond_to do |format|
        format.html { redirect_to request.referrer }
      end
    else
      OwnDevice.create_record(params[:id], params[:items])
      redirect_to user
    end
  end
  
  private
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user || admin?
    end
end
