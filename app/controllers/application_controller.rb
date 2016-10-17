class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

 #  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
 #
 # private
 #
 # def record_not_found
 #   redirect_to action: :index
 # end
 protected
   rescue_from ActiveRecord::RecordNotFound do
     flash[:warning] = 'Resource not found.'
     redirect_back_or root_path
   end

   def redirect_back_or(path)
     redirect_to request.referer || path
   encoding
 end
end
