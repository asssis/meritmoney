class UserMailer < ApplicationMailer
    def alert_meritmoney(user, saldo)
        @user = user
        @donations = MeritMoney.where(deposit_id: user.id)
        @saldo = saldo
        mail to: 'meritmoney@v360.com', from: @user.email, subject: 'Merit Money'
    end
end
