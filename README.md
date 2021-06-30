#Criar Chave Secret do ominioauth no GOOGLE

=> Você deve ter a conta da google

=> Va no link https://console.cloud.google.com/apis/credentials

=> No menu superior clique em Create Credentials

=> Clique em OAuth client ID

Obs

o link de redirecionamento deve ser o DNS + auth/google_oauth2/callback


=> depois de o comando abaixo

bundle exec figaro install

=> e coloque em application.yml

production:
  GOOGLE_CLIENT_SECRET:  "XXX"
  GOOGLE_CLIENT_ID:  "XXX"
development:
  GOOGLE_CLIENT_SECRET: "XXX"
  GOOGLE_CLIENT_ID: "XXX"
