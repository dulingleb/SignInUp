//
//  verifyCodeViewController.swift
//  SignInUp
//
//  Created by Dulin Gleb on 28.8.23..
//

import UIKit

class VerifyCodeViewController: UIViewController {
    
    var userModel: UserModel?

    @IBOutlet weak var wrongCodeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        wrongCodeLabel.text = userModel?.email ?? "hello"

        // Do any additional setup after loading the view.
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
