module DeviseHelper
  def devise_error_messages!
    return "" unless devise_error_messages?
    return "" if resource.errors.empty?
    messages = resource.errors.full_messages.first
    flash[:error] = "#{messages.html_safe}"
    return ''
  end

  def devise_error_messages?
    !resource.errors.empty?
  end

end