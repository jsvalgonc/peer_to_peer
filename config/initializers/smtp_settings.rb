ActionMailer::Base.smtp_settings = {
      :address              => 'smtp.gmail.com',
      :port                 => 587,
      :domain               => 'gmail.com',
      :user_name            => 'jose.j.brito.alves@gmail.com',
      :password             => 'palavrapasse2',
      :authentication       => 'plain',
      :enable_starttls_auto => true
  }