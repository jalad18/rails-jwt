class UserMailer < ApplicationMailer
  def forgot_password(user)
    @user = user
    @reset_password_url = @user.reset_password_token
      
    mail(to: @user.email, subject: 'Reset Your Password')
  end
end
  
