class TargetsController < ApplicationController
  load_and_authorize_resource except: :show
  skip_authorization_check only: :show
  load_resource only: :show

  def new
  end

  def create
    if @target.save
      redirect_to targets_path
    else
      render 'new'
    end
  end

  def index
  end

  def show
    render 'show', layout: nil
  end

  def destroy
    @target.destroy
    flash[:notice] = "#{@target.url} removed"
    redirect_to targets_path
  end
end
