class UserObserver < ActiveRecord::Observer
  # See instruction on 'guides.rubyonrails.org/v2.3.8/action_mailer_basics'
  # 2.1.4 Wire It Up So That the System Sends the Email When a User Signs Up
  def after_create(user)
    UserNotifierMailer.send_signup_email(user)
  end
end
