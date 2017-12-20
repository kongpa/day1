Rails.application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # root 'welcome#view'라고 작성하는 것으로, 레일스에게 애플리케이션의 기본 URL에 대한 접속 요청을
  # welcome 컨트롤러의 index 액션으로 보내라고 지시함
  # get 'welcome/view'는 http://localhost:3000/hello/index라는 요청을
  # hello 컨트롤러의 index 액션으로 할당합니다. 후자는 위에서 컨트롤러 제너레이터(bin/rails
  # generate controller hello view를 실행했을 때, 자동적으로 생성됨
  get 'hello/view'
  # You can have the root of your site routed with "root"
  root 'hello#view'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

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

  match ':controller(/:action(/:id))', via: [ :get, :post, :patch]
  #match 메서드의 매개변수는 URL 패턴. ":<이름>"부분은 변수의 플레이스 홀더.
  #:controller와 :action이 controller와 action의 이름.
  #:id가 액션 매서드에 추가로 전송되는 매개변수(route 매개변수)<<괄호로 싸여진 것은 생략 가능
end
