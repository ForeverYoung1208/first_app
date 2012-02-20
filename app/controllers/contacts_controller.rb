class ContactsController < ApplicationController
  before_filter :set_page

  def index
    
  end

  private

  def set_page
    @selected_page='contacts'
  end

end
