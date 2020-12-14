# Lone Starfighter
A Game inspired by the Galaxian Arcade Series<br>
Left and right arow key to move left and right<br>
A and D to move left and right<br>
W, Up arrow key, or space to fire<br>
enemies will regenerate after being eliminated<br>

play it [here](https://bsu-cs315.github.io/FP-LoneStarfighter/) <br>
or [here](https://baking-bard.itch.io/lone-starfighter)
## Self Reflection
### Project Report
I use the second collision bit layers for the missiles so they don't collide with the player's ship, but the they do with the enemy. The enemies use the first two collision bits to allow collision with the player and missiles from the player. This means that I will either have to rig away programmatically differentiate the enemy missile's collision bits or just create a different system for the enemies.
<br>
Juice review:
  - The enemies and the character both make noise when they are hit with missiles or make other impacts, players missiles make noise when fired.
<br>
In this iteration It I built most of the game, partially because I didn't do anything for the previous iteration, also because I made the most real decisions in terms of game play and how things were going to work. I also Fell in to the trap of on thing being done one way make its easier to keep doing that way rather than a better way discovered later in building
### Evaluation
- [x] D-1: The repository link is submitted to Canvas before the project deadline.
- [x] D-2: The repository contains a README.md file in its top-level directory.
- [x] D-3: The project content is eligible for an ESRB Rating of M or less.
- [x] C-1: Your repository is well-formed, with an appropriate .gitignore file and no unnecessary files tracked.
- [x] C-2: Your release is tagged using semantic versioning where the major version is zero, the minor version is the iteration number, and the patch version is incremented as usual for each change made to the minor version, and the release name matches the release tag.
- [x] C-3: You have a clear legal right to use all incorporated assets, and the licenses for all third-party assets are tracked in the README.md file.
- [x] C-4: The README.md contains instructions for how to play the game or such instructions are incorporated into the game itself.
- [x] C-5: The project content is eligible for an ESRB Rating of T or less.
- [x] C-6: The release demonstrates the core gameplay loop: the player can take action that moves them toward a goal.
- [x] B-1: The README.md file contains a personal reflection on the iteration and self-evaluation, as defined above.
- [x] B-2: The game runs without errors or warnings.
- [x] B-3: The playable game is published to GitHub Pages and linked from the README.md file, or executable builds are provided for download as part of the GitHub release.
- [x] B-4: The source code and project structure comply with our adopted style guides.
- [x] B-5: Clear progress has been made on the game with respect to the project plan.
- [x] A-1: The source code contains no warnings: all warnings are properly addressed, not just ignored.
- [x] A-2: The game includes the conventional player experience loop of title, gameplay, and ending.
- [] A-3: Earn N*⌈P/2⌉ stars, where N is the iteration number and P is the number of people on the team.

- <!--:star:!--> Include a dynamic (non-static) camera
- <!--:star:!--> Incorporate parallax background scrolling
- <!--:star:!--> Use paper doll animations
- <!--:star:!--> Incorporate smooth transitions between title, game, and end states, rather than jumping between states via change_scene
- <!--:star:!--> Support both touch and mouse/keyboard input in the Web build
- <!--:star:!--> Allow the user to control the volume of music and sound effects independently.
- :star: Incorporate juiciness and document it in the README.md
- <!--:star:!--> Incorporate another kind of juiciness and document it in the README.md
- <!--:star:!--> Use particle effects
- :star: Use different layers and masks to manage collisions and document this in the README.md
- <!--:star:!--> Incorporate pop into your HUD or title screen using Tween or AnimationPlayer
- <!--:star:!--> Include an AI-controlled characters
- <!--:star:!--> Include an AI-controlled character controlled with a different AI
- <!--:star:!--> Add a pause menu that includes, at minimum, the ability to resume or return to the main menu
- :star: The game is released publicly on itch.io, with all the recommended accompanying text, screenshots, gameplay videos, etc.

## Third Party Assets
enemy ship sprites done by [clayster2012](https://opengameart.org/users/clayster2012) licensed under [OGA-BY 3.0](https://static.opengameart.org/OGA-BY-3.0.txt)
player ship sprites done by [clayster2012](https://opengameart.org/users/clayster2012) licensed under [CC-BY 3.0](https://creativecommons.org/licenses/by/3.0/)
backgrounds are by [Rawdanitsu](https://opengameart.org/users/rawdanitsu) licensed under [CC0](https://creativecommons.org/publicdomain/zero/1.0/)
Boss Ship is ["Yellow Starship"](https://opengameart.org/content/yellow-starship) by [MillionthVector](http://millionthvector.blogspot.de) licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/)
Explosions are[ "Explosion Set 1 (M484 Games)"](https://opengameart.org/content/explosion-set-1-m484-games) by [Master484]( http://m484games.ucoz.com/) licensed under [CC0](https://creativecommons.org/publicdomain/zero/1.0/)
Font is ["Press Start"](https://www.1001fonts.com/press-start-font.html) by [codeman38](cody@zone38.net) [website](http://www.zone38.net/) licensed under a derivative of the original [Bitstream Vera copyright](https://www.gnome.org/fonts/#copyright), explained further in ```res://assets/fonts/press-start/license.txt```
Sound effects from ["8-bit sound FX"](https://opengameart.org/content/8-bit-sound-fx) by [Dizzy Crow](https://opengameart.org/users/dizzy-crow) licensed under a [CC0](https://creativecommons.org/publicdomain/zero/1.0/)
