//
//  RegisterViewController.swift
//  chatApp
//
//  Created by Nicolas Schmidt on 10/1/17.
//  Copyright © 2017 408 Industries. All rights reserved.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var btnRegister: UIButton!
    
    @IBAction func btnRegister_TouchUpInside(_ sender: Any) {
        // TODO: Perform username/password validation
        
        // Register email and password for new user
        if let email = txtEmail.text, let password = txtPassword.text{
            Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
                
                // Registration successful -> Go to home page
                if user != nil {
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "welcome")
                    self.present(vc!, animated: true, completion: nil)
                    
                }
                // Registration failure -> Check error and show an error message
                else {
                    let alertController = UIAlertController(title: "Registration Failed!", message: (error?.localizedDescription)!, preferredStyle: UIAlertControllerStyle.alert)
                    
                    let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (result: UIAlertAction) -> Void in
                }
                    
                    alertController.addAction(okAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            })
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        txtName.resignFirstResponder()
        txtEmail.resignFirstResponder()
        txtPassword.resignFirstResponder()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
