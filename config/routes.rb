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
  resources :location_tourisms
  resources :tips_tricks
  resources :folktales
  resources :why_sumbars
  resources :reviews

  # --------------------- SEARCH-------------------- #
  resources :tourism_articles do
    collection do
      get :search
    end
  end

#  resources :homes do
#    collection do
#      get :search
#    end
#  end
  # --------------------- SEARCH-------------------- #

  # --------------------- LIKE -------------------- #
  resources :events do
    member do
      post :like
    end
  end
  # --------------------- LIKE -------------------- #
  
  # ------------------- PROFILE ------------------- #
  resources :profiles do
    member do
      get :reviews

      get :folktales
      get :new_folktale
      post :create_folktale

      get :tourism_articles
      get :new_tourism_article
      post :create_tourism_article

      get "edit_tourism_article/:tourism_article_id", action: :edit_tourism_article, as: :edit_tourism_article
      put "update_tourism_article/:tourism_article_id", action: :update_tourism_article, as: :update_tourism_article

      delete "destroy_tourism_article/:tourism_article_id", action: :destroy_tourism_article, as: :destroy_tourism_article
      
      get :location_tourisms
      get :new_location_tourism
      post :create_location_tourism
      
      get :events
      get :new_event
      post :create_event
      
      get :tips_tricks
      get :new_tips_trick
      post :create_tips_trick
      
      get :abouts
      get :edit_about
      put :update_about
    end
  end


  # ------------------- PROFILE ------------------- #

  # ------------------- COMMENT ------------------- #
  resources :events do
    member do
      post :create_comment
    end
  end

  resources :tourism_articles do
    member do
      post :create_comment
    end
  end
  
  resources :folktales do
    member do
      post :create_comment
    end
  end

  resources :tips_tricks do
    member do
      post :create_comment
    end
  end

  resources :events do
    member do
      post :create_comment
    end
  end

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
