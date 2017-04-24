//
//  ViewController.swift
//  Advisor-Scheduler
//
//  Created by Samuel Zamudio on 4/24/17.
//  Copyright © 2017 Paranoid-Jobs. All rights reserved.
//

import UIKit
import Firebase

class SignInVC: UIViewController {
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func signInTapped(_ sender: Any) {
        if let address = email.text, let pass = password.text {
            FIRAuth.auth()?.signIn(withEmail: address, password: pass, completion: { (user, error) in
                if error == nil {
                    // Successfully logged in.

                } else {
                    // Unable to log in.
                    
                    // CURRENTLY IF THE USER DOES NOT EXIST IN THE DATABASE THIS APP WILL AUTOMATICALLY CREATE A NEW USER.
                    // THIS WILL CHANGE. 
                    FIRAuth.auth()?.createUser(withEmail: address, password: pass, completion: {(user, error) in
                        if error != nil {
                            // User could not be created.
                        } else {
                            // User was successfully created.
                        }
                    })
                }
            
            })
        }
    }

}

