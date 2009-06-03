class Admin::SurveysController < AdminController
  def index
    @surveys = Survey.all
  end
  
  def show
    @survey = Survey.find(params[:id])
  end
  
  def new
    @survey = Survey.new
  end
  
  def create
    @survey = Survey.new(params[:survey])
    if @surveys.save
      flash[:notice] = "Successfully created survey."
      redirect_to admin_surveys_path
    else
      render :action => 'new'
    end
  end
  
  def edit
    @survey = Survey.find(params[:id])
  end
  
  def update
    @survey = Survey.find(params[:id])
    if @survey.update_attributes(params[:survey])
      flash[:notice] = "Successfully updated survey."
      redirect_to admin_surveys_path
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy
    flash[:notice] = "Successfully destroyed survey."
    redirect_to admin_surveys_path
  end
  
end
