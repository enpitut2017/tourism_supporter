class MylistsController < ApplicationController

  def index
    #ユーザがログインしていなければログイン画面にリダイレクトする
    if logged_in?
      @user = current_user
      @mylist = @user.mylists
    else
      redirect_to login_path
    end

  end
end
