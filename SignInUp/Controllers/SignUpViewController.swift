//
//  SignUpViewController.swift
//  SignInUp
//
//  Created by Dulin Gleb on 24.8.23..
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var wrongEmailLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var wrongPasswordLabel: UILabel!
    
    @IBOutlet var strongPasswordIndicator: [UIView]!
    
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    @IBOutlet weak var wrongRepeatPasswordLabel: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
        override func viewDidLoad() {
        super.viewDidLoad()
        
        startKeyboardObserver()
        hideKeyboardWhenTappedAround()

        setupUI()
    }
    
    private func setupUI() {
        wrongEmailLabel.isHidden = true
        wrongPasswordLabel.isHidden = true
        wrongRepeatPasswordLabel.isHidden = true
        
        strongPasswordIndicator.forEach { view in
            view.alpha = 0.2
        }
        
    }
    
    private func startKeyboardObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification:NSNotification) {
        guard let userInfo = notification.userInfo else { return }
        var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)

        var contentInset:UIEdgeInsets = self.scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height + 20
        scrollView.contentInset = contentInset
    }

    @objc func keyboardWillHide(notification:NSNotification) {
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInset
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
