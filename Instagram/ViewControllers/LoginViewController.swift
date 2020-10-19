//
//  LoginViewController.swift
//  Instagram
//
//  Created by Mina Kim on 10/17/20.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        signUpButton.layer.cornerRadius = 10
        signInButton.layer.cornerRadius = 10
    }
    
    @IBAction func didTapSignIn(_ sender: Any) {
        let username = usernameTextField.text!
        let password = passwordTextField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password) {(user, error) in
            if user != nil{
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
                print("Successfully logged in")
            } else {
                print("Could not sign in: \(error)")
            }
        }
    }
    
    @IBAction func didTapSignUp(_ sender: Any) {
        let user = PFUser()
        user.username = usernameTextField.text
        user.password = passwordTextField.text
        
        user.signUpInBackground { (success, error) in
            if (success){
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                print("Could not sign up: \(error)")
            }
        }
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
