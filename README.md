 Copyright (c) 2021 Assis Júnior

Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.

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