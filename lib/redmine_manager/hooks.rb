module RedmineManager
  class Hooks < Redmine::Hook::ViewListener
    render_on :view_users_form, :partial => 'user_manager'
  end
end


