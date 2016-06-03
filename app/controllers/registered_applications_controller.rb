class RegisteredApplicationsController < ApplicationController

  def index
    @registered_applications = RegisteredApplication.all
  end

  def new
    @registered_application = RegisteredApplication.new
  end

  def show
    @registered_application = RegisteredApplication.find(params[:id])
  end

  def edit
    @registered_application = RegisteredApplication.find(params[:id])
  end

  def update
    @registered_application = RegisteredApplication.find(params[:id])

    if @registered_application.update_attributes(registered_application_params)
      flash[:notice] = "Application has been successfully updated"
 			redirect_to registered_applications_path
    else
      flash[:error] = "There was an error updating the application. Please make another attempt."
      render :edit
    end
  end

  def create
    @registered_application = RegisteredApplication.new
    @registered_application.name = params[:registered_application][:name]
    @registered_application.url = params[:registered_application][:url]
    @registered_application.user = current_user

    if @registered_application.save
      redirect_to registered_applications_path
    else
      render :new
    end
  end

  def destroy
    @registered_application = RegisteredApplication.find(params[:id])
    if @registered_application.destroy
      flash[:notice] = "Application deleted"
      redirect_to @registered_application
    else
      flash[:error] = "Error deleting application"
      redirect_to @registered_application
    end
  end

  private

  def registered_application_params
    params.require(:registered_application).permit(:name, :url)
  end

end
