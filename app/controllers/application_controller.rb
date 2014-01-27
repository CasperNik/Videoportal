class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :addCategory

  def get_list_with_category
    #id = params([:id])
    @films = Category.find(params[:id]).films.paginate(:page => params[:page], :per_page => 20)
    respond_to do |format|
      format.html { render :partial => 'list_category', :content_type => 'text/html'}
    end
  end
  def get_list_category
    @films = Category.find(params[:id]).films.paginate(:page => params[:page], :per_page => 20)
  end

  def search
    @films = nill
  end


  def addCategory
    @list_categories = Category.all
    @films = Refinery::Films::Film.paginate(:page => params[:page], :per_page => 20)
    @list_films_banner = Refinery::Films::Film.last(10)
  end

end
