Crm::Application.routes.draw do

  resources :engagements

  resources :groups do
    resources :contacts do
      resources :engagements
    end
  end

  get "home/index"
  get "home/about"
  get "groups/:id/join" => 'groups#join', as: :join_group
  get "groups/:id/members" => 'groups#members', as: :group_members
  get "groups/:id/members/remove/:member_id" => 'groups#remove_member', as: :group_remove_member
  get "groups/:id/leave" => 'groups#leave', as: :leave_group
  get "groups/:id/join_complete" => 'groups#join_complete', as: :join_group_complete
  get "mygroups" => 'groups#mygroups', as: :my_groups
  get "groups/:id/tags/:tag" => 'groups#tags', as: :group_tag
  devise_for :users, :path => ''
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
root 'home#index'

  # Example of regular route:
  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
