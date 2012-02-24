class ContactsController < ApplicationController
  before_filter :set_page

  def index
    
  end

  private

  def set_page
    @selected_page=:page5
  end

end
