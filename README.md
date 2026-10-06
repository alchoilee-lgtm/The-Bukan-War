# The Bukan War
A game about a Buku shooting at the Bean’s spaceship while avoiding attacks, to end the Bukan War

<img width="1280" height="720" alt="ezgif com-optimize" src="https://github.com/user-attachments/assets/21519915-00a2-40a1-9da9-e3362fd9eef7" />




## 🎮 [**▶ Play The Bukan War on Itch.io**](https://inzpire.itch.io/the-bukan-war)

## Quickstart
- Click the Button above to open the game
- Press **Run Game** to play the game

## Controls
- Use WASD or Arrow Keys to move
- Click to shoot in the direction you are facing
- Shoot at the Drunk Beans (Yellow Stars) to gain more Ammo/Energy
- Shoot the Drunk Beans when your energy bar is full, to gain health
- Dodge the Boss's attacks

## Features
- Boss Fight
- Juicy particles and screen shake
- Different boss attacks
- Bukan War story

## Technical
- A text to bullet converter, which works by saving 5x5 bitmap codes for each letter in a dictionary, and shooting them in the correct order. The converter splits a 25 digit code into 5 chunks, and the code is made up of 1s and 0s. Every 1 is a pixel in the 5x5 bitmap, and every 0 is not a pixel in the 5x5 bitmap. For example "0111110100101001010001111" would be a example of an 'a'. If we split that into 5 chunks, it would be "01111" "10100" "10100" "10100" and "01111". And it would look like this:

- 01110    Converted   ...
- 10001                .   .
- 11111                .....
- 10001                .   .
- 10001                .   .


## What I did
- I made all the game art
- I made most of the game code
- I made all the storytelling
- My family did the voice acting

## What Ai did
- It made Bitmap codes for letters in the alphabet, I could do it by hand but it would take a long time. 
- It helped me understand how to do certain stuff (for example, how to make Global Variables) since I am new to Godot
- Found some bugs that I couldnt find

## Credits
- Pixabay for the Soundtracks
- JSFXR for the Sound Effects
- Devworm for Particle Tutorial
- Family for the Voice Acting
