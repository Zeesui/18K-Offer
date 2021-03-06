class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]

    def index
      @jobs = case params[:order]
      when 'by_lower_bound'
        Job.order('wage_lower_bound DESC')
      when 'by_upper_bound'
        Job.order('wage_upper_bound DESC')
      else
        Job.order('created_at DESC')
      end
    end

    def show
      @job = Job.find(params[:id])
    end

    def new
      @job = Job.new
    end

    def create
      @job = Job.new(job_params)
      if @job.save
        redirect_to jobs_path
      else
        render :new
      end
    end

    def edit
      @job = Job.find(params[:id])
    end

    def update
      @job = Job.find(params[:id])
      if @job.update(job_params)
        redirect_to jobs_path
      else
        render :edit
      end
    end

    def destroy
      @job = Job.find(params[:id])
      @job.destroy
      redirect_to jobs_path
    end

    private


    def job_params
      params.require(:job).permit(:title, :description, :wage_lower_bound,
         :wage_lower_bound, :company, :city, :contact_email)
    end

    def require_is_admin
      if !current_user.admin?
        falsh[:alert] = 'You are not admin'
        redirect_to root_path
      end
    end
  end
