//
//  MukChiBa.swift
//  RockPaperScissors
//
//  Created by Gundy, Bella
//

final class MukChiba: RockPaperScissors {

    override func compareNumbers(_ computerGameNumber: Int, _ userGameNumber: Int) {
        let differenceNumber: GameJudgment = makeRockPaperScissorsResult(computerGameNumber - userGameNumber)
        switch differenceNumber {
        case .win:
            print(GameJudgment.win.message)
            startMukChiBa(attackTurn: .user)
        case .lose:
            print(GameJudgment.lose.message)
            startMukChiBa(attackTurn: .computer)
        default:
            print(GameJudgment.draw.message)
            startGame()
        }
    }
    
    private func startMukChiBa(attackTurn: Turn) {
        attackTurn.displayTurn()
        GameText.start.displayMukChiBaMessage()
        guard let inputtedUserNumber: Int = Int(bindUserInput()) else {
            GameText.caution.displayMukChiBaMessage()
            startMukChiBa(attackTurn: .computer)
            return
        }
        playMukChiba(inputtedUserNumber, attackTurn)
    }
    
    private func playMukChiba(_ userNumber: Int, _ attackTurn: Turn) {
        switch selectOption(userNumber) {
        case .exit:
            print(GameOver.exit.message)
        case .play:
            compareNumbers(makeComputerNumber(), userNumber, attackTurn)
        default:
            GameText.caution.displayMukChiBaMessage()
            startMukChiBa(attackTurn: .computer)
        }
    }
    
    private func compareNumbers(_ computerGameNumber: Int, _ userGameNumber: Int, _ turn: Turn) {
        let differenceNumber: GameJudgment = makeMukChiBaResult(computerGameNumber - userGameNumber)
        switch differenceNumber {
        case .win:
            startMukChiBa(attackTurn: .user)
        case .lose:
            startMukChiBa(attackTurn: .computer)
        default:
            if turn == .user {
                print(GameOver.userWin.message)
            } else {
                print(GameOver.computerWin.message)
            }
        }
    }
    
    private func makeMukChiBaResult(_ differenceNumber: Int) -> GameJudgment {
        switch differenceNumber {
        case -2, 1:
            return .win
        case -1, 2:
            return .lose
        default:
            return .draw
        }
    }
}
