# Criar Chave Secret do ominioauth no GOOGLE

=> Você deve ter a conta da google

=> Va no link https://console.cloud.google.com/apis/credentials

=> No menu superior clique em Create Credentials

=> Clique em OAuth client ID

Obs

o link de redirecionamento deve ser o DNS + auth/google_oauth2/callback


=> depois de o comando abaixo

bundle exec figaro install

=> e coloque em config/application.yml

production:
  GOOGLE_CLIENT_SECRET:  "XXX"
  GOOGLE_CLIENT_ID:  "XXX"
development:
  GOOGLE_CLIENT_SECRET: "XXX"
  GOOGLE_CLIENT_ID: "XXX"

=> renomeie "database_exemplo.yml" ṕara "database.yml"
=> coloque as variaveis de banco conforme o "start.sh"


# email

=> coloque as configurações em config/initializers/config_mail.rb


# criar o banco de dados


=> docker exec -it meritmoney rails db:create
=> docker exec -it meritmoney rails db:migrate

# entrar no container

# docker exec -i -t meritmoney /bin/bash
# docker exec -i -t meritmoney /bin/bash