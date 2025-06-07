Redmine::Plugin.register :redmine_project_links do
  name 'Project Links'
  author 'Target Integration'
  description 'Adds a top menu tab in each project to store links with title, author, and URL to a Redmine wiki page.'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://www.targetintegration.com'

  project_module :project_links do
    permission :view_project_links, { :project_links => [:index, :show] }, :read => true
    permission :manage_project_links, { :project_links => [:new, :create, :edit, :update, :destroy] }, :require => :member
  end

  menu :project_menu, :project_links, { :controller => 'project_links', :action => 'index' },
       :caption => :label_project_links,
       :after => :activity,
       :param => :project_id
end