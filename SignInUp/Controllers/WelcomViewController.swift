//
//  WelcomViewController.swift
//  SignInUp
//
//  Created by Dulin Gleb on 29.8.23..
//

import UIKit

class WelcomViewController: UIViewController {
    
    var user: UserModel?

    @IBOutlet weak var welcomLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let decodedUserData = UserDefaults.standard.object(forKey: "user") as? Data {
            user = try! JSONDecoder().decode(UserModel.self, from: decodedUserData)
        }
       
        welcomLable.text = "Welcome \(user?.name ?? "new user") to our app"

    }
    

    @IBAction func goToLoginButtonAction(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
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
