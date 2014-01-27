module Refinery
  module Films
    module Admin
     class CategoriesController < ::Refinery::AdminController

      crudify :category,
      :title_attribute => 'name',
      :xhr_paging => true

       def create
         @cat = Category.new(params[:category])
         if @cat.save
             redirect_to  refinery.films_admin_films_path
         else
           render :action => 'new'
         end
       end

      end
    end
  end
end