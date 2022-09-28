import UIKit

class ViewController: UIViewController {

@IBOutlet var buttons: [UIButton]!
var currentPlayer = ""
var board = [String]()
var rules = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

override func viewDidLoad() {
    super.viewDidLoad()
    loadBoard()
    // Do any additional setup after loading the view.
}

@IBAction func buttonPressed(_ sender: UIButton) {
    let index = buttons.index(of: sender)!
    
    if !board[index].isEmpty {
        return
    }
    
    if currentPlayer == "X" {
        sender.setTitle("X", for: .normal)
        currentPlayer = "O"
        board[index] = "X"
    } else {
        sender.setTitle("O", for: .normal)
        currentPlayer = "X"
        board[index] = "O"
    }
    whoWins()
}

func whoWins() {
    for rule in rules {
        let player1 = board[rule[0]]
        let player2 = board[rule[1]]
        let player3 = board[rule[2]]
        if player1 == player2, player2 == player3, !player1.isEmpty {
            print("Winner is \(player2)")
            showAlert(msg: "Good job \(player3) You have won ")
            return
        }
    }
    if !board.contains("") {
        showAlert(msg: "It is a tie!")
    }
}

func showAlert(msg : String) {
    let alert = UIAlertController(title: "Success", message: msg, preferredStyle: .alert)
    let action = UIAlertAction(title: "OK", style: .default) {
        _ in self.reset()
    }
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
}

func reset() {
    board.removeAll()
    loadBoard()
    
    for button in buttons {
        button.setTitle("", for: .normal)
    }
    
}

func loadBoard(){
    for _ in 0..<buttons.count {
        board.append("")
        
    }
    
}
}
