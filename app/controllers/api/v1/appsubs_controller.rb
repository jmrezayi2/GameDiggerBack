module Api
	module V1
		class AppsubsController < ApplicationController
      # GET /tasks
		  # GET /tasks.json
		  def index
  			@appsubs = AppSub.all
	  		render json: @appsubs
		  end

		  # GET /tasks/1
		  # GET /tasks/1.json
		  def show
			  if (AppSub.exists?(params[:id]))
          @appsubs = AppSub.find(params[:id])
  			  render json: @appsubs
        else
          redirect_to :action => 'index'
        end  
      end

		  # POST /tasks
		  # POST /tasks.json
		  def create        
	  		if (AppSub.exists?(:sub_name => sub_params[:sub_name],:app_name => sub_params[:app_name]))
          render json: '{"message": "app in this sub already exists"}'
        else
          @appsubs = AppSub.new(sub_params)
          @appsubs.app_id=(App.find_by app_name: sub_params[:app_name]).id;
          @appsubs.sub_id=(Sub.find_by sub_name: sub_params[:sub_name]).id;
          if @appsubs.save
            render json: @appsubs
			    else
			      render json: @appsubs.errors, status: :unprocessable_entity
			    end
        end  
		  end

		  # PATCH/PUT /tasks/1
		  # PATCH/PUT /tasks/1.json
		  def update
			  @appsubs = AppSub.find(params[:id])
			  if @appsubs.update(sub_params)
			    head :no_content
			  else
			    render json: @appsubs.errors, status: :unprocessable_entity
			  end
		  end

		  # DELETE /tasks/1
		  # DELETE /tasks/1.json
		  def destroy
			  @appsubs = AppSub.find(params[:id])
			  @appsubs.destroy
			  head :no_content
		  end

		  private
			
			def sub_params
			  params.require(:appsub).permit(:app_name, :sub_name, :description, :score, :hot_score, :uid, :app_id, :sub_id)
			end
		end
	end
end

      
 
