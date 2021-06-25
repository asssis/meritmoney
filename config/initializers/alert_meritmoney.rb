Thread.new do
  MeritMoneysJob.new.start_send_email
end