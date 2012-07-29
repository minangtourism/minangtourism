SumbarTourism::Application.routes.draw do

  root :to => 'homes#index'
  mount Ckeditor::Engine => '/ckeditor'
  get '/search' => 'homes#search'

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  get '/users/sign_in' => 'homes#index', :defaults => { :prompt_sign_in => true }
  devise_for :users

  #  post "versions/:id/revert" => "versions#revert", :as => "revert_version"

  resources :sumbar_contents
  resources :contacts
  resources :category_loc_tourisms
  resources :tips_tricks do
    member do
      post :create_comment
    end
  end
  resources :folktales do
    member do
      post :create_comment
    end
  end
  resources :why_sumbars
  resources :reviews

  # ------------------- PROFILE ------------------- #
  resources :profile_tourism_articles, path: 'profiles/:profile_id/tourism_articles', except: :show
  resources :profile_location_tourisms, path: 'profiles/:profile_id/location_tourisms', except: :show
  resources :profile_events, path: 'profiles/:profile_id/events', except: :show
  resources :profile_folktales, path: 'profiles/:profile_id/folktales', except: :show
  resources :profile_tips_tricks, path: 'profiles/:profile_id/tips_tricks', except: :show
  resources :profiles do
    member do
      get :reviews
      get :abouts
      get :edit_about
      put :update_about
    end

  end
  # ------------------- PROFILE -------------------- #

  # --------------------- SEARCH-------------------- #
  resources :tourism_articles do
    collection do
      get :search
    end
    member do
      post :create_comment
    end
  end
  # --------------------- SEARCH------------------- #

  # --------------------- LIKE -------------------- #
  resources :events do
    member do
      post :create_comment
      post :like
    end
  end
  # --------------------- LIKE -------------------- #
  
  # ------------------- COMMENT ------------------- #
  resources :location_tourisms do
    member do
      post :create_comment
    end
  end
  # ------------------- COMMENT ------------------- #
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
