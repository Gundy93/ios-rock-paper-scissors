//
//  GameText.swift
//  RockPaperScissors
//
//  Created by Gundy, Bella
//

enum GameText {
    case start
    case caution
    
    func displayRockPaperScissorsMessage() {
        switch self {
        case .start:
            print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        case .caution:
            print("잘못된 입력입니다. 다시 시도해주세요.")
        }
    }
    
    func displayMukChiBaMessage() {
        switch self {
        case .start:
            print("묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
        case .caution:
            print("잘못된 입력입니다. 다시 시도해주세요.")
        }
    }
}
