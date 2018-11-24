class ContactMailer < ApplicationMailer
  def contact_mail(picture)
    @picture = picture
    @user = @picture.user
    mail to: @user.email ,subject: "作成完了"
  end
end
