Rails.application.routes.draw do
  resources :todo_lists do
    resources :todo_items do
      member do
        patch :completed
      end
    end
  end

  root "todo_list#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
