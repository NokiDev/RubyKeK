class UserMailer < ApplicationMailer
  default from: 'no-reply@local.com'

  def confirm_email(user)
    @user = user
    @url  = "http://127.0.0.1:3000/users/activate/" + @user.activation_key
    mail(to: @user.email, subject: 'Confirm your email address to activate your account')
  end

  def confirm_transaction(ticket)
    @ticket = ticket
    @url = "http://127.0.0.1:3000/tickets/get/" + @ticket.activation_key
    @user = User.find(@ticket.user_id)
    mail(to: @user.email, subject: "Transaction - Success : Get your tickets here")

  end

end
