Redmine::Plugin.register :redmine_pastebin do
  name 'Redmine Pastebin plugin'
  author 'eRIZ'
  description 'Simple Pastebin Plugin for Redmine'
  version '0.0.1'
  url 'http://er1z.github.io/redmine-pastebin'
  author_url 'http://przemyslaw.pawliczuk.pl'

  project_module :pastes do
    permission :access_pastes, :pastes => [:index, :add, :show, :raw, :api]
  end

  menu :project_menu, :redmine_pastebin, { :controller => 'pastes', :action => 'index' }, :caption => 'Pastes', :after => :activity, :param => :project_id
end
