#!/bin/bash

sudo luarocks install luafilesystem # file system handling
sudo luarocks install lunajson # json handling
sudo luarocks install csv # CSV file handling
sudo luarocks install eansi # ANSI color handling
sudo luarocks install argparse # cmdline arg parsing
sudo luarocks install lua-dotenv # .env file reader

mkdir -p ~/scripts/data # Needed to store data for mn project
