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
    
    @IBOutlet weak var continueButton: UIButton!
    
    private var isValidEmail: Bool = false {
        didSet {continueButtonState()}
    }
    private var isValidPassword: Bool = false {
        didSet {continueButtonState()}
    }
    private var isValidRepeatePassword: Bool = false {
        didSet {continueButtonState()}
    }
    
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
    
    @IBAction func emailTextFieldAction(_ sender: UITextField) {
        let email = sender.text ?? "";
        isValidEmail = VerificationService.isValidEmail(email: email)
        wrongEmailLabel.isHidden = isValidEmail
        print(isValidEmail)
    }
    
    @IBAction func passwordTextFieldAction(_ sender: UITextField) {
        let password = passwordTextField.text ?? ""
        setStrengthView(password: password)
        checkRepeatedPassword()
    }
    
    @IBAction func repeatPasswordTextFieldAction(_ sender: UITextField) {
        checkRepeatedPassword()
    }
    
    private func setStrengthView(password: String) {
        let strenghtPassword = VerificationService.strenghtPassword(password: password)
        
        isValidPassword = Bool(strenghtPassword)
        wrongPasswordLabel.isHidden = isValidPassword

        for (index, view) in strongPasswordIndicator.enumerated() {
            view.alpha = 0.2
            if index < strenghtPassword {
                view.alpha = 1
            }
        }
    }
    
    private func checkRepeatedPassword() {
        let repeatedPassword = repeatPasswordTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        let passwordsConfirm = VerificationService.isRepeatedPassword(password1: password, password2: repeatedPassword)
        wrongRepeatPasswordLabel.isHidden = passwordsConfirm
        isValidRepeatePassword = passwordsConfirm
    }
    
    private func continueButtonState() {
        continueButton.isEnabled = isValidEmail && isValidPassword && isValidRepeatePassword
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
