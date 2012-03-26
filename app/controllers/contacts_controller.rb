class ContactsController < ApplicationController
  before_filter :set_page
  before_filter :is_admin, :except=>:index

  def index
    
  end

  private

  def set_page
    @selected_page=:page5
  end

end
