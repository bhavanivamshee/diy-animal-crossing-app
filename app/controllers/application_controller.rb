class ApplicationController < ActionController::Base

helper_method(:current_user)

  def current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def index_helper
    class_name = self.get_class_name
    instance_variable_set("@#{params["controller"]}", class_name.all)
  end
  
end
