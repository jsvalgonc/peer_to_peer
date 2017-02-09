class InvitationMailer < ApplicationMailer
  #default from: "jsvalgonc@gmail.com"
  default from: "jose.j.brito.alves@gmail.com"
  
  def invitation_email(invitation,host)
      @invitation = invitation
      #@url = "https://peer-to-peer-lending-jsvalgonc.c9users.io/users/sign_up/" + invitation.inv_key
      @url =  "https://" + host + "/users/sign_up/" + invitation.inv_key
      byebug
      mail :to => invitation.email, :subject => "Convite"
  end
end
