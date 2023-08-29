//
//  SignInViewController.swift
//  SignInUp
//
//  Created by Dulin Gleb on 24.8.23..
//

import UIKit

class SignInViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    var user: UserModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        hideKeyboardWhenTappedAround()
        
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signInButtonAction(_ sender: Any) {
        if let decodedUserData = UserDefaults.standard.object(forKey: "user") as? Data {
            user = try! JSONDecoder().decode(UserModel.self, from: decodedUserData)
        }
        
        if user?.email != emailTextField.text ||
            user?.password != passwordTextField.text {
                errorLabel.isHidden = true
                return
        }
        
        let mainStoryBoard = UIStoryboard(name: "MainStoryboard", bundle: nil)
        let mainViewController = mainStoryBoard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        
        self.show(mainViewController, sender: user)
    }
    
    
    private func setupUI() {
        errorLabel.isHidden = true
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
