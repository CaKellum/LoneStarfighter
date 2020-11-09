# Lone Starfighter
A Game inspired by the Galaxian Arcade Series
Left and right arow key to move left and right
A and D to move left and right
W, Up arrow key, or space to fire
enemies will regenerate after being eliminated
## Self Reflection
### Project Report
I use the second collision bit layers for the missiles so they don't collide with the player's ship, but the they do with the enemy. The enemies use the first two collision bits to allow collision with the player and missiles from the player. This means that I will either have to rig away programmatically differentiate the enemy missile's collision bits or just create a different system for the enemies.

This iteration has been a bit of a struggle for me mostly due to personal life upsets and family being family. I had to move in to an apartment and announce a Baby Shower for my Fiancé so my family knew about it. All of that time constraint put on with Walmart demanding overtime in the wake of this month long Black Friday have really messed with my usual schedule. In the iteration I had the goal of doing the intricate enemy movement patterns which I knew it would be a challenge and given my time constraint of the family calling and unpacking and setting up utilities I didn't complete that one. Though I do Know now how to do it know through about an hour of thinking and reading, I don't believe I would have time to make it production ready, so I will leave it unfinished. Over all I also think that a more appropriate job of slicing the game in the beginning would have also have assisted in the ease of moving forward. But there is a positive to this whole thing I think while doing this is was the least stressed worried and most calm I have been in about a week. So in my general tone I think this is a great way for a weary and tired college student to reinvigorate their joy in programing and have a bit of fun. I think that all of the faults in my process could have been avoided with alittle bit more perseverance and forethought but hindsight is nothing but 2020.
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
- [] B-3: The playable game is published to GitHub Pages and linked from the README.md file, or executable builds are provided for download as part of the GitHub release.
- [x] B-4: The source code and project structure comply with our adopted style guides.
- [x] B-5: Clear progress has been made on the game with respect to the project plan.
- [x] A-1: The source code contains no warnings: all warnings are properly addressed, not just ignored.
- [] A-2: The game includes the conventional player experience loop of title, gameplay, and ending.
- [x] A-3: Earn N*⌈P/2⌉ stars, where N is the iteration number and P is the number of people on the team.

- <!--:star:!--> Include a dynamic (non-static) camera
- <!--:star:!--> Incorporate parallax background scrolling
- <!--:star:!--> Use paper doll animations
- <!--:star:!--> Incorporate smooth transitions between title, game, and end states, rather than jumping between states via change_scene
- <!--:star:!--> Support both touch and mouse/keyboard input in the Web build
- <!--:star:!--> Allow the user to control the volume of music and sound effects independently.
- <!--:star:!--> Incorporate juiciness and document it in the README.md
- <!--:star:!--> Incorporate another kind of juiciness and document it in the README.md
- <!--:star:!--> Use particle effects
- :star: Use different layers and masks to manage collisions and document this in the README.md
- <!--:star:!--> Incorporate pop into your HUD or title screen using Tween or AnimationPlayer
- <!--:star:!--> Include an AI-controlled characters
- <!--:star:!--> Include an AI-controlled character controlled with a different AI
- <!--:star:!--> Add a pause menu that includes, at minimum, the ability to resume or return to the main menu
- <!--:star:!--> The game is released publicly on itch.io, with all the recommended accompanying text, screenshots, gameplay videos, etc.

## Third Party Assets
enemy ship sprites done by (clayster2012)[https://opengameart.org/users/clayster2012] licensed under (OGA-BY 3.0)[https://static.opengameart.org/OGA-BY-3.0.txt]
player ship sprites done by (clayster2012)[https://opengameart.org/users/clayster2012] licensed under (CC-BY 3.0)[https://creativecommons.org/licenses/by/3.0/]
backgrounds are by (Rawdanitsu)[https://opengameart.org/users/rawdanitsu] licensed under (CC0)[https://creativecommons.org/publicdomain/zero/1.0/]
