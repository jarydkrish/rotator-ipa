# frozen_string_literal: true

ActiveSupport.on_load(:action_mailer) do
  ActionMailer::Base.smtp_settings = {
    address: 'smtp.sendgrid.net',
    port: 587,
    user_name: ENV.fetch('SENDGRID_USERNAME', nil),
    password: ENV.fetch('SENDGRID_PASSWORD', nil),
    authentication: :login,
    enable_starttls_auto: true
  }
end
