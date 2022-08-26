# 묵찌빠 게임

## 📖 목차
1. [소개](#-소개)
2. [타임라인](#-타임라인)
3. [시각화된 프로젝트 구조](#-시각화된-프로젝트-구조)
4. [실행 화면](#-실행-화면)
5. [트러블 슈팅](#-트러블-슈팅)
6. [참고 링크](#-참고-링크)

## 🌱 소개

`Gundy`와 `bella` 팀이 만든 가위(1), 바위(2), 보(3) / 묵(1), 찌(2), 빠(3) 총 3개의 숫자의 값을 비교하여 진행하는 묵찌빠 게임입니다.

## 📆 타임라인

- 220822
    - STEP 1
        - 임의의 가위 바위 보를 결정하는 `makeComputerNumber` 함수 구현
        - 가위 바위 보 게임을 시작하는 함수 `startGame` 함수 구현
        - 사용자의 입력을 받는 `takeUserInput` 함수 구현
        - 게임을 진행하는 `playGame` 함수 구현
        - 두 값을 비교해 승패를 출력하는 `compareNumbers` 함수 구현
        - [1st Pull request 작성](https://github.com/yagom-academy/ios-rock-paper-scissors/pull/152)
- 220823
    - STEP 1 Feedback 반영
        - 함수만으로 구성돼있던 것을 클래스와 구조체로 구현
        - `RockPaperScissors` 클래스로 타입 최종 결정 및 내부 메서드 은닉화
        - [1st Pull Request Merged]( https://github.com/yagom-academy/ios-rock-paper-scissors/pull/152)
        - STEP 1 흐름도 작성
    - STEP 2
        - STEP 1의 `RockPaperScissors` 클래스를 상속받는 `MukChiBa` 클래스 생성 및 `compareNumbers` 메서드 `override`
        - `MukChiBa` 클래스 내부에 가위바위보 결과에 따라 묵찌빠를 시작하는 `startMukChiBa` 메서드 구현
        - `MukChiBa` 클래스 내부에 묵찌빠를 진행하는 `playMukChiBa` 메서드 구현
        - 공격턴을 포함해 두 값을 비교할 `compareNumbers` 메서드 `overload`
        - [2nd Pull Request 작성](https://github.com/yagom-academy/ios-rock-paper-scissors/pull/161)
- 220824
    - STEP 2 보완
        - Magic Literal 수정
            - 게임 종료시 출력될 문자열을 열거형 `GameOver`의 원시값으로 변경
            - 가위바위보 판정시 출력될 문자열을 열거형 `WinLoseDraw`의 원시값으로 변경
            - 게임을 시작할 때 출력될 문자열을 프로퍼티 `startText`로 변경
            - 오입력 시 출력될 문자열을 프로퍼티 `cautionText`로 변경
            - 열거형 `UserSelect`와 사용자의 입력에 따라 `UserSelect`의 `case`를 반환하는 `selectOption` 함수 추가
            - 사용자와 컴퓨터의 값 차이에 따라 `WinLoseDraw`의 `case`를 반환하는 `makeResult` 함수 추가
        - 코드의 흐름에 따른 코드블럭 순서 재배치
    - STEP 2 Feedback 1차 반영
        - 타입 단위로 파일 분리
            - 어색한 타입 이름 리네이밍
        - `RockPaperScissors` 내부 프로퍼티를 `GameText`의 원시값으로 변경
        - 함수 `startMukChiBa`의 조건문을 삼항연산자로 간소화
    - STEP 2 Feedback 2차 반영
        - 미사용 코드 삭제
        - `Enum`의 `rawValue`를 대체할 프로퍼티와 메서드 작성
        - 클래스 메서드 은닉화 및 `MukChiBa` 클래스에 `final` 키워드 추가
- 220825
    - finishing the project
        - [2nd Pull Request Merged](https://github.com/yagom-academy/ios-rock-paper-scissors/pull/161)
        - `STEP 2` 브랜치를 `main`으로 병합
        - STEP 2 흐름도 작성
        - 묵찌빠 번호 게임 결과에 따른 게임 판정 `makeMukChiBaResult` 메서드 및 문구 출력 `displayMukChiBaMessage` 메서드 추가
        - README.md 작성

## 👀 시각화된 프로젝트 구조

#### STEP 1
<img src=https://i.imgur.com/TlBsrmZ.png width=600> 


#### STEP 2
<img src=https://i.imgur.com/bmYFUTW.png width=600> 

## 💻 실행 화면

#### STEP 1
| 승리 / 무승부 | 패배 / 입력 오류 |
|:--:|:--:|
|![](https://i.imgur.com/57PIHhW.gif)|![](https://i.imgur.com/nrI8a0j.gif)|

#### STEP 2
| 승리 | 패배 |
|:--:|:--:|
|![](https://i.imgur.com/VdHEmHh.gif)| ![](https://i.imgur.com/jNNx27T.gif)|

## ❓ 트러블 슈팅

- #### bindUserInput 반환 타입
    사용자의 입력을 받는 `bindUserInput` 함수에서 사용자 입력을 `Int` 타입의 값으로 반환하고자 하였는데, 입력이 잘못 되었을 경우 안내문구와 함께 다시 진행이 되어야 합니다. 다시 진행하기 위해 재귀함수로 해결하고자 하니 잘못된 값 입력 후 다시 진행된 게임이 종료 될 때 게임 종료 문구가 이중으로 출력되는 등의 문제가 발생하였습니다. 이 문제를 `bindUserInput` 함수가 타입의 형변환 및 오류처리까지 겸하지 않고, 사용자 입력을 옵셔널 바인딩을 통해 `String`으로 반환하는 방식으로 역할을 줄여 해결하였습니다. 후에 `Int` 타입으로의 형변환 및 오류처리는 `bindUserInput` 함수를 호출하는 부분에서 이루어지는 것으로 변경하였습니다.

- #### 매직 리터럴과 enum 타입
    게임 진행에 따라 안내 문구가 필요한 곳에서 반복적으로 출력되는 부분과 반복되는 부분이 아니더라도 타입으로 정의하여 필요시 인스턴스를 생성하여 사용하는 것이 코드의 간결화와 가독성을 위해 좋다고 생각이 되었습니다.
이러한 점은 반영하고자, 사용자로부터 입력받은 값에 따라 게임 여부를 결정하는 UserSelect 타입, 게임이 종료 구분에 따라 타입 내 프로퍼티로 해당 메세지를 반환하는 GameOver 타입, 묵찌빠 게임 판단과 그에 따른 메세지를 반환하는 GameJudgment 타입, 게임 진행시 필요 안내문구를 메서드로 출력하는 GameText 타입, 묵찌빠 게임 판단에 따라 누구의 진행 순서인지 메서드로 출력하는 displayTurn 타입을 정의하고 파일을 분리하게 되었습니다.
enum 내에서 프로퍼티와 메서드를 사용할 수 있음을 알게되었으며, 두 경우를 모두 사용하고 싶어서 '메세지'를 프로퍼티로 가지는 타입과 '메세지 출력'을 메서드로 가지는 타입을 만들어서 비교해 볼 수 있었습니다. 

- #### Class 타입 결정 문제
    STEP 2의 경우 가위바위보에서 묵찌빠로 연결되는데, 구조체를 사용할 경우 STEP 1에서 구현한 함수의 일부분을 수정해야 하지만, 클래스를 사용한다면 묵찌빠의 클래스를 생성해 가위바위보를 상속받을 수도 있고, `override`를 통해 묵찌빠 인스턴스의 경우만 가위바위보에서 묵찌빠로 이어지고, 가위바위보 인스턴스는 가위바위보만 하게끔 할 수 있을 것 같아 해당 타입을 선택했습니다. 
    
- #### 파일 분리
    `private` 접근 수준으로 은닉화 과정을 거친 `compareNumbers` 메서드는 상속 후에 재정의할 수 없어서 문제가 되었습니다 .은닉화를 포기하지 않으면서 상속 및 재정의를 하기 위해 `fileprivate` 접근 수준으로 변경하였고, 재정의할 수 있었습니다.
그러나, 매직리터럴에 따른 중복되는 부분을 파일을 추가해 enum으로 정리를 하는 과정에서 가위봐위보와 묵찌빠게임을 한 파일이 아닌 파일분리를 해야 하는 것이 아닌가 하는 의견이 나오게 되었습니다. 은닉화와 파일분리의 우선순위를 고민하다가, 파일분리를 우선으로 생각하게 되었으며 그에 따라 파일분리를 위해 가위바위보 게임을 진행하는 함수인 playRockPaperScissors 를 제외하고 모두 은닉화를 제거 한 후에 파일 분리를 하게 되었습니다. 
    
    
- #### Commit
    STEP 2의 코멘트에 따라 작업을 하던 중, 문제가 발생했습니다. 건디의 실수로 벨라가 `Push`한 커밋을 `Pull`하지 않고 작업을 진행하다가 커밋을 해 `Push`하려고 하니 작업이 충돌을 일으켰습니다. 이를 해결하기 위해 revert도 시도해보고, `HEAD`를 이전 커밋으로 옮겨 벨라의 커밋을 `Pull`하여 작업하기도 했지만, 이후 원하는 브랜치로 `Push`를 할 수 없는 문제가 발생했습니다. 이에 머지를 시도해보려고 `HEAD`를 옮긴 순간 또 다시 작업본을 날려먹었습니다. 결국 해당 `Git` 폴더를 삭제하고 새로 `clone`하여 다시 폴더를 생성했다. 마지막으로 `Push`된 벨라의 커밋본을 `Pull`해서 해당 브랜치로 다시 작업을 진행해 `Commit`과 `Push`를 하는데에 성공했습니다. 이런 실수를 한 것이 처음이기 때문에 상황을 해결하는 데에 난항을 겪었지만 그 이후로는 프로젝트를 마무리할 때 까지 같은 이슈는 발생하지 않았습니다.
    
- #### Pull Request 대상 브랜치
    Pull Request를 `main` 브랜치를 대상으로 보낸 실수가 있었습니다. merge할 `base repository` 브랜치를 잘못 설정해서 문제였는데, 여태 PR의 이름만 수정하는 용도로 사용하던 Pull Request 상단 `Edit`이 합칠 브랜치마저 수정하는 용도로 사용할 수 있었습니다.

- #### 묵찌빠 게임판정 및 출력문구 수정
    기존에는 가위바위보와 묵찌빠 게임 진행 시에 모두 동일한 문구를 출력했었는데, 가위바위보와 묵찌빠에 할당된 번호가 다름을 알게되었습니다. 이 문제를 해결하고자, `MukChiBa` 타입 내에 묵찌빠 번호 게임 결과에 따른 게임 판정을 `GameJudgment` 타입으로 반환하는 `makeMukChiBaResult` 메서드를 추가하였으며, `GameText` 타입 내에 묵찌빠 게임 진행시에 해당되는 문구를 출력하는 `displayMukChiBaMessage` 메서드 추가하여 문제를 해결하였습니다. 
    
## 🔗 참고 링크

- Swift API Design Guidelines
    - [naming](https://www.swift.org/documentation/api-design-guidelines/#naming)
- Swift Language Guide
    - [Control Flow](https://docs.swift.org/swift-book/LanguageGuide/ControlFlow.html)
    - [Functions](https://docs.swift.org/swift-book/LanguageGuide/Functions.html)
    - [Enumerations](https://docs.swift.org/swift-book/LanguageGuide/Enumerations.html)
    - [Properties](https://docs.swift.org/swift-book/LanguageGuide/Properties.html)
    - [Methods](https://docs.swift.org/swift-book/LanguageGuide/Methods.html)
    - [Lexical Structure 중 Literal](https://docs.swift.org/swift-book/ReferenceManual/LexicalStructure.html)
- Magic Literal 참고링크
    - [[Swift] Special Literal 알아보기](https://sujinnaljin.medium.com/swift-special-literal-알아보기-5120f9596424)
    - [나무위키 - 매직넘버](https://namu.wiki/w/%EB%A7%A4%EC%A7%81%EB%84%98%EB%B2%84#s-4.1)

---

[🔝 맨 위로 이동하기](#묵찌빠-게임)
