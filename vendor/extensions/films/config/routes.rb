Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :films do
    resources :films, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :films, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :films, :except => :show do
        collection do
          post :update_positions
        end
      end
      resources :categories
      resources :uploadfilms do
        get 'import', on: :collection
        get 'fix_title', on: :collection
      end
    end
  end

end
