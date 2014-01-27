module Refinery
  module Films
    class FilmsController < ::ApplicationController

      before_filter :find_all_films
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @film in the line below:
        respond_to do |format|
          format.json do
            render :json => @films
          end
          format.html do
            present(@page)
          end
        end
      end

      def show
        @film = Film.find(params[:id])
         #if request.path != refinery.films_film_path(@film)
         #  redirect_to @film, status::moved_permanently
         #end
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @film in the line below:
        respond_to do |format|
          format.json do
            render :json => @film
          end
          format.html do
            present(@page)
          end
        end

      end

      def search
        @films = Film.find_with_index(params[:query].to_ascii)
      end

    protected

      def find_all_films
        @films = Refinery::Films::Film.paginate(:page => params[:page], :per_page => 20)
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/films").first
      end

    end
  end
end
