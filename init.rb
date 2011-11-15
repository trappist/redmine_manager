require 'redmine'
require 'dispatcher'
require 'user_patch'
require_dependency 'principal'
require_dependency 'user'
require_dependency 'redmine_manager/hooks'

Dispatcher.to_prepare do
  User.send(:include, ::UserPatch)
end

Redmine::Plugin.register :redmine_manager do
  name 'Redmine Manager plugin'
  author 'Rocco Stanzione'
  description 'Adds a manager/report relationship to users'
  version '0.0.1'
  url 'http://githib.com/trappist/redmine_manager'
  author_url 'http://github.com/trappist'
end
