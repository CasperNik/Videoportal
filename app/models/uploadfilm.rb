class Uploadfilm < ActiveRecord::Base
  attr_accessible :desc, :img, :link_to_film, :name, :preview, :_type, :_template, :_cached_page_id, :url

end
