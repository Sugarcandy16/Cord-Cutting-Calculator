class UserMailer < ApplicationMailer
    def welcome_email(user)
        @user = user
        mail(to: @user.email, subject: 'Welcome to Cord-Cutting-Calculator')
    end
    def forgot_password(user)
      @user = user
      @greeting = "Hi"
      flash[:notice] = 'Password has been reset!'
      #mail(to: @user.email, subject: 'Reset password instructions')
    end
end
