require 'refinerycms-core'

module Refinery
  autoload :FilmsGenerator, 'generators/refinery/films_generator'

  module Films
    require 'refinery/films/engine'

    class << self
      attr_writer :root

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def factory_paths
        @factory_paths ||= [ root.join('spec', 'factories').to_s ]
      end
    end
  end
end
