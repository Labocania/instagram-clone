Rails.application.routes.draw do
  get 'profiles/show'

  devise_for :users, :controllers => { registrations: 'registrations' }
  root "posts#index"
  resources :posts do
      resources :comments
  end
  get ':user_name', to: 'profiles#show', as: :profile
  get ':user_name/edit', to: 'profiles#edit', as: :edit_profile
  patch ':user_name/edit', to: 'profiles#update', as: :update_profile
=begin
                  Prefix Verb   URI Pattern                                 Controller#Action
           profiles_show GET    /profiles/show(.:format)                    profiles#show
        new_user_session GET    /users/sign_in(.:format)                    devise/sessions#new
            user_session POST   /users/sign_in(.:format)                    devise/sessions#create
    destroy_user_session DELETE /users/sign_out(.:format)                   devise/sessions#destroy
           user_password POST   /users/password(.:format)                   devise/passwords#create
       new_user_password GET    /users/password/new(.:format)               devise/passwords#new
      edit_user_password GET    /users/password/edit(.:format)              devise/passwords#edit
                         PATCH  /users/password(.:format)                   devise/passwords#update
                         PUT    /users/password(.:format)                   devise/passwords#update
cancel_user_registration GET    /users/cancel(.:format)                     registrations#cancel
       user_registration POST   /users(.:format)                            registrations#create
   new_user_registration GET    /users/sign_up(.:format)                    registrations#new
  edit_user_registration GET    /users/edit(.:format)                       registrations#edit
                         PATCH  /users(.:format)                            registrations#update
                         PUT    /users(.:format)                            registrations#update
                         DELETE /users(.:format)                            registrations#destroy
                    root GET    /                                           posts#index
           post_comments GET    /posts/:post_id/comments(.:format)          comments#index
                         POST   /posts/:post_id/comments(.:format)          comments#create
        new_post_comment GET    /posts/:post_id/comments/new(.:format)      comments#new
       edit_post_comment GET    /posts/:post_id/comments/:id/edit(.:format) comments#edit
            post_comment GET    /posts/:post_id/comments/:id(.:format)      comments#show
                         PATCH  /posts/:post_id/comments/:id(.:format)      comments#update
                         PUT    /posts/:post_id/comments/:id(.:format)      comments#update
                         DELETE /posts/:post_id/comments/:id(.:format)      comments#destroy
                   posts GET    /posts(.:format)                            posts#index
                         POST   /posts(.:format)                            posts#create
                new_post GET    /posts/new(.:format)                        posts#new
               edit_post GET    /posts/:id/edit(.:format)                   posts#edit
                    post GET    /posts/:id(.:format)                        posts#show
                         PATCH  /posts/:id(.:format)                        posts#update
                         PUT    /posts/:id(.:format)                        posts#update
                         DELETE /posts/:id(.:format)                        posts#destroy
                 profile GET    /:user_name(.:format)                       profiles#show
            edit_profile GET    /:user_name/edit(.:format)                  profiles#edit
=end
end
