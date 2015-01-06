module Api
	module V1
		class SubsController < ApplicationController
      # GET /tasks
		  # GET /tasks.json
		  def index
  			@subs = Sub.all
	  		render json: @subs
		  end

		  # GET /tasks/1
		  # GET /tasks/1.json
		  def show
			  if (Sub.exists?(params[:id]))
          @sub = Sub.find(params[:id])
  			  render json: @sub
        else
          redirect_to :action => 'index'
        end  
      end

		  # POST /tasks
		  # POST /tasks.json
		  def create        
	  		if (Sub.exists?(:sub_name => sub_params[:sub_name]))
          render json: '{"message": "sub already exists"}'
        else
          @sub = Sub.new(sub_params)
          if @sub.save
            render json: @sub
			    else
			      render json: @sub.errors, status: :unprocessable_entity
			    end
        end  
		  end

		  # PATCH/PUT /tasks/1
		  # PATCH/PUT /tasks/1.json
		  def update
			  @sub = Sub.find(params[:id])
			  if @sub.update(sub_params)
			    head :no_content
			  else
			    render json: @sub.errors, status: :unprocessable_entity
			  end
		  end

		  # DELETE /tasks/1
		  # DELETE /tasks/1.json
		  def destroy
			  @sub = Sub.find(params[:id])
			  @sub.destroy
			  head :no_content
		  end

		  private
			
			def sub_params
			  params.require(:sub).permit(:sub_name, :description, :score , :icon_path)
			end
		end
	end
end

      

