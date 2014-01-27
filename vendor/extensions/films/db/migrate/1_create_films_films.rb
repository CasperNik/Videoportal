class CreateFilmsFilms < ActiveRecord::Migration

  def up
    create_table :refinery_films do |t|
      t.integer :id
      t.string :name
      t.string :description
      t.integer :photo_id
      t.date :date_upload
      t.date :date_release
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-films"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/films/films"})
    end

    drop_table :refinery_films

  end

end
