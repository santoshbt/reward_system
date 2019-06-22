Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/customer_rewards', :to => 'rewards#get_rewards'
end
