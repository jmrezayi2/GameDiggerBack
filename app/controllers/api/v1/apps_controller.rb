

		require 'httparty'

module Api
	module V1
    class AppsController < ApplicationController

      #GET /tasks
		  #GET /tasks.json
		  def index
  			@apps = App.all
        
        
        icongraber_1_start1='<img alt="Cover art" class="cover-image" src="';
        icongraber_1_start2='http';
        icongraber_1_end='"/>';

        icongraber_2_start1='<a class="document-subtitle category" href="/store/apps/category/';
        icongraber_2_start2='category/';
        icongraber_2_end='">';


        icongraber_3_start1='<div class="document-title">';
        icongraber_3_start2='<p>';
        icongraber_3_end='</p>?';
        
        response = HTTParty.get('http://play.google.com/store/apps/details?id=com.lima.doodlejump');
        
        
        num=response.search(icongraber_1_start1);
	      str3=response.substr(num,response.length);
    	  num=str3.search(icongraber_1_start2);
	      str3=str3.substr(num,str3.length);
	      num2=str3.search(icongraber_1_end);
	      str3=str3.substr(0,num2);
  	    msg=str3;
        
        
        render html: msg
        
#        render json: @apps
		  end

		  # GET /tasks/1
		  # GET /tasks/1.json
		  def show
			  if (App.exists?(params[:id]))
          @app = App.find(params[:id])
  			  render json: @app
        else
          redirect_to :action => 'index'
        end  
      end

		  # POST /tasks
		  # POST /tasks.json
		  def create        
	  		if (App.exists?(:app_name => app_params[:app_name]))
          render json: '{"message": "app already exists"}'
        else
          @app = App.new(app_params)
          if @app.save
            render json: @app
			    else
			      render json: @app.errors, status: :unprocessable_entity
			    end
        end  
		  end

		  # PATCH/PUT /tasks/1
		  # PATCH/PUT /tasks/1.json
		  def update
			  @app = App.find(params[:id])
			  if @app.update(app_params)
			    head :no_content
			  else
			    render json: @app.errors, status: :unprocessable_entity
			  end
		  end

		  # DELETE /tasks/1
		  # DELETE /tasks/1.json
		  def destroy
			  @app = App.find(params[:id])
			  @app.destroy
			  head :no_content
		  end

		  private
			
			def app_params
			  params.require(:app).permit(:app_name,:path,:name,:category,:price)
			end
		end
	end
end



