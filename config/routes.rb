Rails.application.routes.draw do

  resource :books,  do
    collection do
    	delete :destroy
    	patch :update
    end
  end

  resources :authors do 
  	collection do
    	delete :destroy
    	patch :update
    end
  end

  root to: 'books#index'
end
