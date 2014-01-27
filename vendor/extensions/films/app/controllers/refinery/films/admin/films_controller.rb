module Refinery
  module Films
    module Admin
      class FilmsController < ::Refinery::AdminController
        before_filter :addCategory
        crudify :'refinery/films/film',
                :title_attribute => 'name',
                :xhr_paging => true
        def update
            @film = Film.find(params[:id])
          if @film.update_attributes(params[:film])
             @list_cat = params[:category]
             @list_cat.each do |cat,no|
             @film.categories += [Category.find(cat)]
             end
            redirect_to refinery.films_admin_films_path, notice: "Фильм обновлен"
          else
            render :edit
          end
        end
        def edit
          @film = Refinery::Films::Film.find(params[:id])
          @selected_ratings = Hash[@film.categories.map {|film| [film.id, film.name]}]
        end
        def create
          @film = Refinery::Films::Film.new(params[:film])
          if @film.save
            @list_cat = params[:category]
            @list_cat.each do |cat,no|
            @film.categories += [Category.find(cat)]
            end
            redirect_to refinery.films_admin_films_path, notice: "Фильм успешно создан"
          else
            redirect_to :new, notice: "Проверьте правильность вводимых данных"
          end
        end


        private
        def addCategory
          @category = Category.order('name ASC').all
          @list_films = Film.all
          @selected_ratings = Hash[]
        end
      end
    end
  end
end
