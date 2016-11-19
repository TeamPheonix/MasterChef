class UserObserver < ActiveRecord::observers
  def after_create(user)
    UserMailer.deliver_welcome_email(user)
  end
end
