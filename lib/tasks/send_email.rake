namespace :send_email do
  desc "Email special newsletter to users"
  task newsletter2: :environment do
    User.all.each do |u|
      UserNotifierMailer.newsletter2(u).deliver
    end
  end

end
