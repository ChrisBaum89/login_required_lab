class SessionsController < ApplicationController

  def new
  end

  def create
    if session[:id]
      redirect_to '/'
    elsif params[:name] != nil && params[:name] != ""
      session[:name] = params[:name]
      redirect_to '/'
    else
      redirect_to '/login'
    end
  end

  def destroy
    session.delete :name
    redirect_to '/login'
  end

  def current_user
    return head(:forbidden) unless session.include? :name
  end
end
