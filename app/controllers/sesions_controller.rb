class SessionsController < ApplicationController

  before_action :require_login
  skip_before_action :require_login, only: [:index]

  def new
  end

  def create
    if !params[:name] || params[:name].empty?
      redirect_to '/sessions/new'
    else
      session[:name] = params[:name]
      redirect_to '/'
    end
  end

  def destroy
    session.delete :name
  end

  private

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end


end
