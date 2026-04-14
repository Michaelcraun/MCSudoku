# MCSudoku

MCSudoku is an in-progress iOS Sudoku app built with SwiftUI. The repository currently includes a Sudoku board generator, solving logic, difficulty-based puzzle creation, and an early UI shell for rendering the 9x9 grid.

## Current Status

This project is still in an early stage.

- The puzzle model and board utilities are implemented in Swift.
- The app renders a basic Sudoku grid in SwiftUI.
- Unit tests cover core board behavior such as blank board creation, solvability checks, candidate generation, and puzzle generation by difficulty.
- Gameplay interactions, notes vs. pen input, and full app flow are not finished yet.

## Tech Stack

- Swift 5
- SwiftUI
- Core Data
- XCTest
- Xcode project targeting iOS 14+

## Project Structure

```text
MCSudoku/
├── Data/
│   └── Sudoku.swift
├── Views/
│   ├── ContentView.swift
│   └── GridView.swift
├── Persistence.swift
└── MCSudokuApp.swift
```

## What The Code Does Today

`Sudoku.swift` contains the main puzzle logic:

- Creates a blank 9x9 board
- Fills a valid solved board
- Removes cells based on difficulty
- Checks whether a board is solvable
- Finds valid candidates for a location
- Produces a formatted string representation for debugging and tests

The UI layer currently provides a grid layout and placeholder tap handling for future interaction.

## Running The App

1. Open `MCSudoku.xcodeproj` in Xcode.
2. Select the `MCSudoku` scheme.
3. Run on an iPhone or iPad simulator.

## Running Tests

Run the `MCSudokuTests` target from Xcode to verify the current board-generation and solving behavior.

## Roadmap

- Connect the board model to the SwiftUI interface
- Add player input and validation
- Support pencil marks and pen mode
- Persist puzzle state and progress
- Expand UI and interaction polish

## License

No license is currently specified in this repository.
