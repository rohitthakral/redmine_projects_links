RedmineApp::Application.routes.draw do
  resources :projects do
    resources :project_links
  end
end