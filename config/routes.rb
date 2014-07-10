# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
match 'projects/:project_id/pastes', :to => 'pastes#index'
match 'projects/:project_id/pastes/add/api', :to => 'pastes#api'
match 'projects/:project_id/pastes/add', :to => 'pastes#add', :as => 'paste_add'
match 'projects/:project_id/pastes/:id', :to => 'pastes#show'
match 'projects/:project_id/pastes/:id/raw', :to => 'pastes#raw', :as => 'paste_raw'

