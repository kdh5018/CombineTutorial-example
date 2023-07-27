//
//  ValidationViewController.swift
//  CombineTutorial-example
//
//  Created by 김도훈 on 2023/07/27.
//

import UIKit
import Combine
import CombineCocoa

// Username 기본적으로 안내하는 Label : "Username has to be at least 5 characters"
// Password 기본적으로 안내하는 Label : "Password has to be at least 5 characters"
// 둘 다 5글자를 넘어서면 해당 Label 없어지게
// 버튼은 기본적으로 안 눌리게(텍스트 흰색) -> 조건을 만족하면 버튼 눌리게(텍스트 검은색)이 되면서 Alert 띄우기

class ValidationViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var passwordLabel: UILabel!
    
    @IBOutlet weak var completeButton: UIButton!
    
    var viewModel: ValidationVM = ValidationVM()
    
    var subscriptions = Set<AnyCancellable>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameLabel.text = "Username has to be at least 5 characters"
        passwordLabel.text = "Password has to be at least 5 characters"
        
        completeButton.isEnabled = false
        
    }
    
    @IBAction func isCompleted(_ sender: UIButton) {
        
    }
    
    func showAlert() {
        
        let alert = UIAlertController(title: "문자 입력", message: "문자가 잘 입력되었습니다✔️", preferredStyle: .alert)
        
        let completedAction = UIAlertAction(title: "확인", style: .default) { _ in
            
        }
        
        alert.addAction(completedAction)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    
}
