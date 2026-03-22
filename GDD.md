# Game Design Document — Rock Paper Scissors

## 1. Game Overview
**Title:** Rock Paper Scissors AI  
**Genre:** Casual / Strategy  
**Platform:** Desktop (Godot Engine)  
**Mode:** Single Player (Player vs AI)

A digital version of the classic Rock Paper Scissors game where the player competes against an AI opponent. The focus is on quick gameplay, responsive interaction, and simple AI behavior that can be expanded in future iterations.

---

## 2. Core Gameplay
- Player selects one of three options:
  - Rock
  - Paper
  - Scissors
- AI selects its move automatically
- Result is determined instantly:
  - Rock beats Scissors
  - Scissors beats Paper
  - Paper beats Rock
- Each round produces:
  - Win, Lose, or Draw outcome

---

## 3. Game Rules
- Player chooses an option via UI buttons
- AI generates a move after player input
- Outcome is evaluated based on standard rules
- Scores are updated after each round
- Each game is 5 rounds.

---

## 4. Features Implemented
- Interactive UI for player choices
- AI opponent (basic/random decision-making)
- Outcome evaluation system (win/lose/draw)
- Score tracking (Player vs AI)
- Round result display
- Game result display
- Restart / Reset game option
- Basic menu navigation (Start / Exit)

---

## 5. Technical Design
**Engine:** Godot (GDScript)

### Architecture
- **Game Scene**
  - Buttons for Rock, Paper, Scissors
  - Labels for result and score
- **Menu Scene**
  - Navigation buttons

### Logic Components
- `player_choice`
- `ai_choice`
- `determine_winner(player, ai)`
- `update_score()`

### AI Design
- Current: Random selection
- Future scope: Pattern-based or adaptive AI

---

## 6. Controls
**Mouse Input**
- Click button → Select move
- Menu buttons → Navigate or reset

---

## 7. UI / UX
- Minimal, clean layout
- Clear visual feedback for:
  - Player choice
  - AI choice
  - Round result
- Text-based or simple icon representation

---

## 8. Limitations
- AI uses random logic only (not intelligent)
- No animations or advanced transitions
- No persistent score saving
- Limited visual polish

---

## 9. Future Improvements
- Implement adaptive AI (pattern recognition)
- Add animations for choices
- Add difficulty levels
- Improve UI/UX (themes, transitions)
- Add statistics tracking (win rate, streaks)
- Add multiplayer (local or online)

---

## 10. Project Goal
To develop a simple AI-driven game demonstrating:
- Basic decision-making systems
- Game loop implementation
- Player interaction handling
- Clean separation of logic and UI
- Expandable architecture for AI improvements