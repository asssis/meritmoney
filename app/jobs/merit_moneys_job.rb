class MeritMoneysJob < ApplicationJob
  def send_mail_merit_money
    users = User.all
    users.each do |user|
      date = Date.today
      donations = MeritMoney.where(:created_at => date.beginning_of_month...date.end_of_month, deposit_id: user.id)
      saldo = donations.inject(0) { |sum, product| sum += product.value }
      check_emails = CheckEmail.where(user_id: user.id).order(created_at: :desc).first
      if(saldo < 60 && (check_emails.present? && check_emails.created_at < Date.today ))
        begin
          UserMailer.alert_meritmoney(user, saldo).deliver_now!
        rescue
          puts '-------------TENTANDO ENVIAR NOVAMENTE--------------'
          puts '-------------TENTANDO ENVIAR NOVAMENTE--------------'
          sleep(5)
          retry
        end
        check = CheckEmail.new(user_id: user.id)
        check.save!
        sleep(5)
      end
    end
  end

  def start_send_email
    day = [22, 25, 28]
    begin
      while true
        if(day.include?(Date.today.day))
          MeritMoneysJob.new.send_mail_merit_money
        end
        sleep(50)
      end
    rescue
      puts '-------------ERRO ENVIO EMAIL--------------'
      puts '-------------ERRO ENVIO EMAIL--------------'
      puts '-------------ERRO ENVIO EMAIL--------------'
    end
  end
end
