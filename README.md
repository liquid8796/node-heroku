# NodeJS-DuinoCoin-Miner-Heroku
A **[duino-coin](https://duinocoin.com/)**.miner made in NodeJS. This repo is fork of [https://github.com/LDarki/NodeJS-DuinoCoin-Miner](https://github.com/LDarki/NodeJS-DuinoCoin-Miner). This miner can be runned on the [Heroku](https://heroku.com/) cloud.

![img](https://i.imgur.com/B8Sxi6p.png)

## Requirements:

1. NodeJS: https://nodejs.org/
2. Git: https://git-scm.com/
3. Heroku CLI: https://devcenter.heroku.com/articles/heroku-cli
4. Heroku account: https://heroku.com/

## Installation:

1. Download this repo or use this command: `git clone https://github.com/Gunthersuper/node-duino-miner-heroku`.
2. In the miner folder find a `config.ini` file. Fill all the needed info: your duinocoin username, mining key (if you have), hashlib (sha1 by default), worker (worker name that you can see on the duinocoin dashboard), threads (how many workers, 4 for mostly devices).
3. Default config file:
```
username=gunthersuper
mining_key=
hashlib=js-sha1
worker=node-miner
threads=2
```
4. Open cmd or PowerShell in the miner folder. Enter some commands to deploy the miner to Heroku:
   - `Heroku login`
   - `git init`
   - `git add .`
   - `git commit -m 'commit'`
   - `heroku create`
   - `git push heroku main` (or if it isnt working `git push heroku main`)
   - `heroku ps:scale web=0`
   - `heroku ps:scale bot=1`

Heroku logs:

![img](https://i.imgur.com/2u8Hikf.png)

### Additional info:
1. I recommend to use 2 threads for 1 app.
2. You can make upto 5 apps per 1 account. But you can make a lot of Heroku accs.

### You can also run this on your PC

Install the dependencies
```bash
npm i
```

Run the miner
```
node index
```

Notes:

- Default config file:
```
username=gunthersuper
mining_key=
hashlib=js-sha1
worker=node-miner
threads=2
```

- You can test for the best hash lib using this command:
```
node testLib.js
```
In order to use that script you need to have the config.ini file in the same directory.
