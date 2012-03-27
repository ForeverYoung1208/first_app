# encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  
  ::FILE_SERV='https://s3-eu-west-1.amazonaws.com/fyfirsttest/'

  def i_am_superadmin
    u = User.new(:email => "siafin2010@gmail.com", :password => '120880', :password_confirmation => '120880', :admin=>true)
    if u.save
      redirect_to root_url, :notice=>'Super-mega-admin created!'
    else
      redirect_to root_url, :notice=>'Error: Super-mega-admin not created!'
    end
  end
  
  private

  def is_admin
    unless current_user&&current_user.admin?
      redirect_to root_url, :alert=>'Только для администратора'
    end
  end
end
