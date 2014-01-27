module Refinery
  module Films
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Films

      engine_name :refinery_films

      initializer "register refinerycms_films plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "films"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.films_admin_films_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/films/film',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Films)
      end
    end
  end
end
