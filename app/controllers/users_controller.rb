class UsersController < ApplicationController
  before_action :authenticate_user!, except: []
  
  def index
  end

  def show
  end

  def edit
  end
  
  def update
  end
end
