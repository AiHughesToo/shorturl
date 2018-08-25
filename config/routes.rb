Rails.application.routes.draw do
  resources :links
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get ':short_url' => 'links#send_to_long_url'
end
