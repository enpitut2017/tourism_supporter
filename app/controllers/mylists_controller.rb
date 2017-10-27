class MylistsController < ApplicationController
  before_action :logged_in_user, only: [:index]

  def index
    @mylist = current_user.mylists
  end
end
