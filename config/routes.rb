Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'tournaments#index'

  resources :tournaments, only: %i[index show new create] do
    resources :categories, controller: 'tournaments/categories' do
      resources :fighters, controller: 'tournaments/categories/fighters'
    end
    resources :academies, controller: 'tournaments/academies' do
      resources :fighters, controller: 'tournaments/academies/fighters'
    end
    resources :categories_fights, controller: 'tournaments/categories_fights' do
      resources :fights, controller: 'tournaments/categories_fights/fights'
    end
  end

  resources :academies
end
