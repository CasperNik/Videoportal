module Refinery
  module Films
    module Admin
      class UploadfilmsController < ::Refinery::AdminController

        crudify :uploadfilm,
                :title_attribute => 'name',
                :xhr_paging => true

        def index
        end
        def import
          import_films = Uploadfilm.all
          import_films.each do |import|
            film = Refinery::Films::Film.new
            film.name = import.name
            film.description = import.desc
            film.photo_id = import.img
            film.link = import.link_to_film
            film.preview = import.preview
            film.save
          end
          #Refinery::Films::Film.each(&:save)

          respond_to do |format|
            format.html { render :text => "Добавление прошло успешно." }
          end
        end

        def fix_title
          allfilms = Refinery::Films::Film.all
           allfilms.each do |film|
            artitle = film.name.split(' ')
            film.name = ''
              if (artitle.last == 'качестве')
                artitle[0..(artitle.size-7)].each do |item|
                  film.name +=" "+item
                end
                film.save
              end
          end
          respond_to do |format|
            format.html { render :text => "Заголовки обновленны." }
          end
        end

        def show

        end
        def create
          require 'json'
          uploaded_io = params[:file]
          if uploaded_io.nil?
          else
          data = open(uploaded_io).read
          datajson = JSON.parse(data)
              datajson.each do |d|
                Uploadfilm.create(d)
              end
              preview1 = Uploadfilm.all
              preview1.each do |film|
                film.preview = truncate( film.desc, :omission => ' ...', :length=>200)
                film.img = get_photo_id(film.img)
                film.save
              end
          end
          @upload = Uploadfilm.all.size
          @loadfilms = Uploadfilm.all.last
          render :action=> 'index', notice: 'Файл получен'
        end

        def get_photo_id (url_to_img)
          require 'fastimage'
          path = Rails.root.join('public/system/refinery/images')
          url = url_to_img
          out = system("wget -P #{path} #{url}")
          img_name = url.split('/').last
          img_size = FastImage.size(url)
          newimg = ::Refinery::Image.new
          newimg.image_mime_type = 'image/jpeg'
          newimg.image_name=img_name
          newimg.image_width = img_size[0]
          newimg.image_height = img_size[1]
          newimg.image_uid = img_name
          if newimg.save
            return newimg.id
          else
            return nil
          end
        end

        def truncate(text, options = {}, &block)
          if text
            length  = options.fetch(:length, 30)
            content = text.truncate(length, options)
            content = options[:escape] == false ? content.html_safe : ERB::Util.html_escape(content)
            content << capture(&block) if block_given? && text.length > length
            content
          end
        end
       end
    end
  end
end