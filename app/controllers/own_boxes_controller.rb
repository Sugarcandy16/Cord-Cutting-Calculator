class OwnBoxesController < ApplicationController
  before_action :logged_in_user, :correct_user

  def show
    if !params[:reset1]
      @all_set_top_boxes = SetTopBox.order(:name)
      @set_top_boxes = Array.new
      @user.own_boxes.each do |own_box|
        @set_top_boxes << SetTopBox.find(own_box.set_top_box_id)
      end
      @user = User.find(params[:id])
      @own_boxes = Array.new
      @user.own_boxes.each do |own_box|
        @own_boxes << own_box.set_top_box_id
      end
    end
  end
  
  def update_own_set_top_box
    user = User.find(params[:id])
    OwnBox.delete_record(params[:id])
    if params[:items] == nil
      respond_to do |format|
        format.html { redirect_to request.referrer }
      end
    elsif params[:reset1]
      respond_to do |format|
        format.html { redirect_to request.referrer }
      end
    else
      OwnBox.create_record(params[:id], params[:items])
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
