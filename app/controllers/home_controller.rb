class HomeController < ApplicationController
  def index
    @contacts = current_user.phones.first.contacts
  end
end
