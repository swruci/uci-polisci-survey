Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :surveys do
    resources :pages do
      resources :questions do
        resources :answers
      end
    end

    resources :survey_responses do
      collection do
        get 'thankyou'
      end
    end
  end

  root 'surveys#index'

end
