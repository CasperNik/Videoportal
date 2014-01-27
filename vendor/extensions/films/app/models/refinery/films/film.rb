module Refinery
  module Films
    require 'stringex'

    class Film < Refinery::Core::BaseModel
      self.table_name = 'refinery_films'

      attr_accessible :id, :name, :description, :preview, :photo_id, :date_upload, :date_release, :link, :position, :category

      validates :name, :presence => true, :uniqueness => true

      default_scope :order => 'date_upload DESC'

      belongs_to :photo, :class_name => '::Refinery::Image'
      has_and_belongs_to_many :categories

     extend FriendlyId
      friendly_id :name, use: [:slugged, :history]

      acts_as_indexed :fields => [:ascii_title, :body]
      alias_attribute :title, :name
      alias_attribute :body, :description

      private
      def ascii_title
        self.title.to_ascii
      end

    end
  end
end
