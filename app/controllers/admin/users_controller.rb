class Admin::UsersController < ApplicationController
  before_filter :authenticate_user! #, except => [:load_user] #, :only => [:index]
 # before_filter :load_user
  
  #def index
  #  @users=User.all
  #end

  def index
    @users = User.where("id NOT IN (?)", current_user.id) # don't display the current user in the users list; go to account management to edit current user details
  end

  def new
    @user=User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "#{ @user.email } created."
      redirect_to admin_users_path
    else
      render :action => 'new'
    end
  end

  def edit
    @user=User.find_by_id(params[:id])
    render :new
  end

  def update
    params[:user].delete(:password) if params[:user][:password].blank?
    params[:user].delete(:password_confirmation) if params[:user][:password].blank? and params[:user][:password_confirmation].blank?
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated User."
      redirect_to admin_users_path
    else
      ## render :action => 'edit'
      redirect_to edit_admin_user_path(params)
    end
  end

  def delete
  end

  def destroy
    redirect_to users_path and return if params[:cancel]
    if @user.destroy
      flash[:notice] = "#{ @user.email } deleted."
      redirect_to admin_users_path
    end
  end

  def show
    @user = User.find(params[:id])
#    respond_with @user
 end


  private
  
#  def load_user
#    @user=User.find(params[:id]) if params[:id]
#  end
  
end
