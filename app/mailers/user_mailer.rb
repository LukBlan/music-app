class UserMailer < ApplicationMailer
  def activation_mail
    user = params[:user]
    @url = activate_users_url + "?activation_token=" + user.activation_token
    mail(to: user.email, subject: "Account Activation")
  end
end
