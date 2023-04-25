## Telegram bot boilerplate 

This is boilerplate of telegram bot Ruby using Webhook. 

## Configure application
Install dependencies 
```bash
   bundle install
```
Create database 
```bash
   rake db:create
```
Load migrations 
```bash
   rake db:migrate
```
Create config/secrets.yml and write:
```yaml
    development:
      telegram_bot_ruby: YOUR_BOT_TOKEN
      url: YOUR_SERVER_URL
```
## Start application
```bash
   rails s 
```
