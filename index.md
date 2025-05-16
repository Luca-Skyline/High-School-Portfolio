
# Luca DalCanto Skyline Programming Portfolio

[Click Here](https://github.com/Luca-Skyline) to see my profile and contact info.

## Table of Contents
- [Computer-Related Awards and Experiences](#awards)
- [2024-2025](#2425)
  - [UpBeat Group Project](#upbeat)
  - [Conway's Game of Life Individual Project](#conway)
  - [IB Research Projects](#ib)
    - Extended Essay: Fourier Transformation Optimization
    - Physics: Propeller Simulation
    - Math Analysis: Predator-Prey Simulation
  - [Class Assignments](#seniorclass)
- [2023-2024](#2324)
  - [Check4Mate Chess Vision Project](#check4mate)
  - [Robotics Class Notebook](#robotics)
- [2022-2023](#2223)
  - [Star Chess Group Project](#starchess)
  - [Dungeon Dash Video Game](#dungeon)
  - [SoundVision NEDC Entry](#soundvision)
  - [Class Asignments](#sophomoreclass)

<a id = "awards"></a>
# Awards and Experiences
- Philo T. Farsworth Governor's Award Recepient. This is an award earned through the Sterling Scholar program and granted to one student in Utah to reward innovation, creativity, and technical skills.
- Skyline High CTE Presidential Scholar
- National Presidential Scholar Semifinalist (1 of 600 in the US) for academics.
- Utah TSA (Technology Student Association) Awards
  - Software Development: 1st (2024)
  - Coding: 2nd (2024)
  - Technology Bowl: 2nd (2024)
  - Digital Music Production: 1st (2025)
  - Video Game Design: 3rd (2023)
- MESA Utah NEDC (National Engineering Design Competition): 2nd (2023)
- Utah CTE Certifications
  - Advanced (Year 2) Programming
  - Python (Programming 2)
  - Java (Programming 2)
  - C++ (Programming 2)
  - C# (Programming 2)
  -   Robotics 1
  -   Programming 1

<a id = "2425"></a>
# 2024-2025 Projects

<a id = "upbeat"></a>
## 2024-25 Programming Class Group Project (UpBEAT)
This is a project done by the "RIBIT" (RISE International Baccleaurate Information Tecnology) team in my Year 2 programming class. The software generates songs procedurally using math and a little bit of music theory knowledge. The math for generating the songs is created from the ground up; libraries are only used to export the data as audio or MIDI to your device. Windows preferred. I was the team lead and primary backend programmer on this project.

[Github Development Repo](https://github.com/Luca-Skyline/Up-Beat)

<a id = "conway"></a>
## Conway's Game of Life Individual Class Project
This is an individual project I created for Year 2 programming. Following user parameters, it generates random permutations/mutations of a seed in Conway's Game of Life. The objective is to find small seeds with very long lifetimes. It implements generations, where each generation is a slight mutation on the last, and only the fittest seed in each generation survives to the next.

[Github Development Repo](https://github.com/Luca-Skyline/GOLSeedEvo)

<a id = "id"></a>
## IB Research Projects
In preparing my research projects for the IB diploma, I wrote several computer programs from which to gather and analyze empirical data.

### IB Extended Essay: Fourier Transformation Optimization
This code was used to collect and interpret the data for my Extended Essay research paper. It examines the Fast Fourier Transform (FFT) and proposes a geometric alternative to compare it against in order to find a threshold of noise where the FFT is preferred. I coded it in python for ease of data analysis.

[Research Paper]()
[Undocumented Code](https://github.com/Luca-Skyline/Fourier-Research-Paper)

### IB Physics: Propeller Simulation
This code was used in my IB physics internal assessment. I created it to simulate a propeller spinning under the drag of varying air densities in order to determine if air density has an impact on the optimal pitch of a propeller blade. So I could include a graphical component, I learned and utilized Rust for this project. Notice: as this was a physics project, not a programming project, I did employ generative AI as an assitive and educational tool. However, the underlying code logic and approach are my own.

[Research Paper]()
[Undocumented Code](https://github.com/Luca-Skyline/FluidDensityPropellerSimulator)

### IB Math Analysis: Predator and Prey Simulation
In this project, I created a basic simulation of the interaction between predators and prey in an ecosystem to see how both populations fluctuated with time. This data was used in my IB math internal assessment as several mathematical models were mapped to it. This code is simple and created in Processing so as to include a graphic component for qualitative analysis.

[Research Paper]()
[Undocumented Code](https://github.com/Luca-Skyline/PredatorPreySim)

<a id = "seniorclass"></a>
## 2022-23 Programming Class Projects
### Complex Applications 4: Pandora's Box (Encrypted Journal)
This application can read and write from a file called "my_journal.txt". Before you can access the contents of the file, you must enter the "magic number" which acts as the key to encrypting and decrypting the text. For the exiting contents of "my_journal.txt" I have used a magic number of 42.

When you add a note to the journal, it gets encrypted before being written to the text file. The encryption is just:
- The characters of your input string get converted to their Unicode integer value
- The magic number is added to the Unicode integer value
- The new integers are converted back into characters
- Those characters are written to the file.

The inverse process takes place when reading from the file. Only when the "magic numbers" of both input and output are the same can you recover the original message.

<img src="https://github.com/Luca-Skyline/B8_Adv_Programming_Portfolio/blob/42a64495add7aa9be40888d907003683fa21b0d6/images/Pandora%20Intro.png" width = 400>
<img src="https://github.com/Luca-Skyline/B8_Adv_Programming_Portfolio/blob/42a64495add7aa9be40888d907003683fa21b0d6/images/Pandora%20Home.png" width = 250>

### Complex Applications 3: Magic the Gathering Database
With this application, users can keep track of the Magic cards in their collection. They can create cards with a name, quantity, multiple card types, rarity, and legendaryness. New cards are appended to an Arraylist. They can then view, edit, and delete cards, as well as filter and view their collection based on card type. This last feature is recursive so you can filter down to specific combinations such as "artifact creatures".

<img src="https://github.com/Luca-Skyline/B8_Adv_Programming_Portfolio/blob/3146ce35242ca16c83ee130689297760dfc3f6a9/images/MTGD_Home.png" width=350>
<img src="https://github.com/Luca-Skyline/B8_Adv_Programming_Portfolio/blob/7d3fd292bb0870b0f5ba0e2bd48a7bbb13213fc2/images/MTGD_New_Card.png" width=350>

<a id = "2324"></a>
# 2023-2024 Projects

<a id = "check4mate"></a>
## Check4Mate

<a id = "robotics"></a>
## Robotics Development Notebook


<a id = "2223"></a>
# 2022-2023 Projects

<a id = "starchess"></a>
## 2022-23 Programming Class Group Project (STAR CHESS)

Click here to play [STAR CHESS!](https://replit.com/@the-do-nothings/Star-Chess?v=1)

I was the primary programmer/developer on this project and head of the programming team. I did the main logic for the chess moves, check/checkmate logic, and rudimentary AI engine. For more info, check out the group's [dev repo](https://github.com/Luca-Skyline/SoundVision-Code). I divied out some of the other programming tasks to the awesome [Spencer Wood](https://github.com/swood136). Check out the GitHub for more info on my other awesome group members who did a great job with ASCII art and UI.

<img src="https://raw.githubusercontent.com/Luca-Skyline/programming1portfolio/main/images/chessImages/title.png" alt="Running Game" width="600"/>

<img src="https://raw.githubusercontent.com/Luca-Skyline/programming1portfolio/main/images/chessImages/gameplay.png" alt="Running Game" width="800"/>

![Running Game](https://raw.githubusercontent.com/Luca-Skyline/programming1portfolio/main/images/chessImages/tutorial.png)

<a id = "dungeon"></a>
## Dungeon Dash (Utah TSA Competetion)

Click here to play [DUNGEON DASH!](https://calvinaawebb.github.io/dungeon-dash-game/)

Created for the TSA State Video Competetion, 3 other sophomores and I created "Dungeon Dash", a puzzle party game. It allows two players to race, mostly blinded, through a maze of traps and puzzles in an attempt to reach the center before the other player. The dungeon has several levels and items you can use to your advantage - as well as puzzles that are not only tricky to solve but tricky to figure out how to solve. Consider the fact that the dungeon itself is really a series of mazes, and it becomes clear why Dungeon Dash it the ultimate puzzle within a puzzle within a puzzle game.

I was primary code developer and in charge of audio assests on this project. Thanks, [Calvin Webb](https://github.com/calvinaawebb) (Project Manager), [Micah Tien](https://github.com/MisterNo0ne) (Developer), and [Jeffery Zou](https://github.com/HelloIverson) (Graphics Artist, Developer) for your collaboration on this project.

Our TSA team placed 3rd in the state for this project, qualifying for nationals.

![Running Game](https://raw.githubusercontent.com/Luca-Skyline/programming1portfolio/main/images/ddtutorial.png)

![Running Game](https://raw.githubusercontent.com/Luca-Skyline/programming1portfolio/main/images/ddgameplay.png)

<img src="https://raw.githubusercontent.com/Luca-Skyline/programming1portfolio/main/images/ddpuzzle.png" alt="Running Game" width="600"/>

[Web Hosted Game (Using Github Pages)](https://calvinaawebb.github.io/dungeon-dash-game/)

[Github Dev Repo](https://github.com/calvinaawebb/dungeon-dash-game)

<a id = "soundvision"></a>
## SoundVision (Utah Engineering Design Challenge / NEDC)

This project, done as an extension of the MESA club, uses an Arduino MEGA ADK and a lot a bit of C++ (via Arduino IDE) to perform a Fast Fourier Transform and analyze music. This project was done with Micah Tien and Jeffery Zou like the project above and I once again am very grateful for their help. Individually, I wrote the code and did the wiring for this project.

Our NEDC team placed 2nd in the state for this project.

![Poster](https://raw.githubusercontent.com/Luca-Skyline/programming1portfolio/main/images/soundvision.png)

[FFT Code](https://github.com/Luca-Skyline/SoundVision-Code)

<a id="sophomoreclass"></a>
## 2022-23 Programming Class Projects

### Calculator

OOP Graphic Calculator built in Processing 4
Split Screen built in to reduce user clicks with immeadiate results. Keyboard usability is the same as a normal calculator.

![Running Calculator](https://raw.githubusercontent.com/Luca-Skyline/programming1portfolio/main/images/calculator.png)

[Calculator Source Code](https://github.com/Luca-Skyline/programming1portfolio/tree/main/src/Calculator)

### Space Game

Avoid the rocks... (made with Processing 4)

![Running Game](https://raw.githubusercontent.com/Luca-Skyline/programming1portfolio/main/images/asteriods.png)
![Running Game](https://raw.githubusercontent.com/Luca-Skyline/programming1portfolio/main/images/gamestart.png)

[Space Game Source Code](https://github.com/Luca-Skyline/programming1portfolio/tree/main/src/SpaceGame)

### Pig Latin Translator

Software that will translate English into Pig Latin. Can do one word, like a name, or entire sentences and paragraphs, as shown below. Uses more advanced, in-depth forms of Pig Latin, including the transfer of all starting consonants to the end of the word (not just the first letter), adding "WAY" if the word starts with a vowel, accounting for spaces, and removing puncuation that isn't important to Pig Latin (the idea behind Pig Latin focusses on the pronunciation of words, not their written form).

![Running Pig Latin Software](https://raw.githubusercontent.com/Luca-Skyline/programming1portfolio/main/images/piglatin.png)

[Pig Latin Source Code](https://github.com/Luca-Skyline/programming1portfolio/blob/main/src/PigLatin/main.cpp)
