# frozen_string_literal: true

ActiveSupport.on_load(:action_mailer) do
  ActionMailer::Base.smtp_settings = {
    address: 'smtp.sendgrid.net',
    port: 587,
    user_name: ENV['SENDGRID_USERNAME'],
    password: ENV['SENDGRID_PASSWORD'],
    authentication: :login,
    enable_starttls_auto: true
  }
end
