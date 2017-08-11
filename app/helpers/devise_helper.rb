module DeviseHelper
  def devise_error_messages!
    return "" unless devise_error_messages?
    return "" if resource.errors.empty?
    messages = resource.errors.full_messages.map { |msg| msg }.join    
    return flash[:error] = "#{messages.html_safe}" 
  end

  def devise_error_messages?
    !resource.errors.empty?
  end

end