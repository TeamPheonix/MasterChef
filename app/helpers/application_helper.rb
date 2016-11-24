module ApplicationHelper

  def error_messages_for_users(object)
    render(:partial => 'application/error_messages', :locals => {:object => object})
  end

  def error_messages_for_recipes(object)
    render(:partial => 'application/error_messages_recipes', :locals => {:object => object})
  end

end
