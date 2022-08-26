//
//  RockPaperScissors.swift
//  RockPaperScissors
//
//  Created by Gundy, Bella
//

class RockPaperScissors {
    
    func startGame() {
        GameText.start.displayRockPaperScissorsMessage()
        guard let inputtedUserNumber: Int = Int(bindUserInput()) else {
            GameText.caution.displayRockPaperScissorsMessage()
            startGame()
            return
        }
        playRockPaperScissors(inputtedUserNumber)
    }
    
    func bindUserInput() -> String {
        guard let userInput = readLine() else {
            return bindUserInput()
        }
        return userInput
    }
    
    private func playRockPaperScissors(_ userNumber: Int) {
        switch selectOption(userNumber) {
        case .exit:
            print(GameOver.exit.message)
        case .play:
            compareNumbers(makeComputerNumber(), userNumber)
        default:
            GameText.caution.displayRockPaperScissorsMessage()
            startGame()
        }
    }
    
    func selectOption(_ userNumber: Int) -> UserSelect {
        switch userNumber {
        case 0:
            return .exit
        case 1, 2, 3:
            return .play
        default:
            return .wrong
        }
    }
    
    func makeComputerNumber() -> Int {
        let computerNumber: Int = Int.random(in: 1...3)
        return computerNumber
    }
    
    func compareNumbers(_ computerGameNumber: Int, _ userGameNumber: Int) {
        let differenceNumber: GameJudgment = makeRockPaperScissorsResult(computerGameNumber - userGameNumber)
        switch differenceNumber {
        case .win:
            print(GameJudgment.win.message)
        case .lose:
            print(GameJudgment.lose.message)
        default:
            print(GameJudgment.draw.message)
            startGame()
        }
    }
    
    func makeRockPaperScissorsResult(_ differenceNumber: Int) -> GameJudgment {
        switch differenceNumber {
        case -1, 2:
            return .win
        case -2, 1:
            return .lose
        default:
            return .draw
        }
    }
}
