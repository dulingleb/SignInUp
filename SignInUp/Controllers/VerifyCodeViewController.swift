//
//  verifyCodeViewController.swift
//  SignInUp
//
//  Created by Dulin Gleb on 28.8.23..
//

import UIKit

class VerifyCodeViewController: UIViewController {
    
    var userModel: UserModel?
    var verifyCode: String = ""

    @IBOutlet weak var wrongCodeLabel: UILabel!
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var codeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(VerifyCodeViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
          
        NotificationCenter.default.addObserver(self, selector: #selector(VerifyCodeViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        verifyCode = generateVerifyCode(count: 6)
        codeLabel.text! += verifyCode

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func continueButtonAction(_ sender: Any) {
        if codeTextField.text != verifyCode {
            wrongCodeLabel.isHidden = false
            print(verifyCode)
            return
        }
        
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(userModel) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: "user")
        }
        
        
        performSegue(withIdentifier: "goToWelcomScreen", sender: userModel)
    }
    
    private func generateVerifyCode(count: Int) -> String {
        var result = ""
         repeat {
             // Create a string with a random number 0...9999
             result = String(format:"%0\(count)d", arc4random_uniform(UInt32(pow(10, Double(count)))) )
         } while Set<Character>(result).count < count
         return result
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
            
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
           // if keyboard size is not available for some reason, dont do anything
           return
        }
      
      // move the root view up by the distance of keyboard height
      self.view.frame.origin.y = 0 - keyboardSize.height / 2
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        // move back the root view origin to zero
        self.view.frame.origin.y = 0
        
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "goToWelcomScreen" else { return }
        //guard let destination = segue.destination as? WelcomViewController,
         //   let userModel = sender as? UserModel else { return }
        
        //destination.userModel = userModel
    }

}
