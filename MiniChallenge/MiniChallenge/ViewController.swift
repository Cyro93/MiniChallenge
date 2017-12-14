//
//  ViewController.swift
//  MiniChallenge
//
//  Created by Ciro Esposito on 11/12/17.
//  Copyright © 2017 MindBlowers. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class ViewController: UIViewController {

    //Object initializate
    @IBOutlet weak var segmentLog: UISegmentedControl!
    @IBOutlet weak var textEmail: UITextField!
    @IBOutlet weak var textPassword: UITextField!
    @IBOutlet weak var buttonLogin: UIButton!
    @IBOutlet weak var labelError: UILabel!
    @IBOutlet weak var nicknameText: UITextField!
    //End object
    
    
    //When pressed the button Login/SignUp
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        if !textsBoxEmpty()     //If textboxs aren't empty
        {
            
            if segmentLog.selectedSegmentIndex == 0              //Login selected
            {
                login()
            }
            else      //Sign Up selected
            {
                let email    = textEmail.text
                let password = textPassword.text
                let nickname = nicknameText.text!  //Nickname without Option
                if nickname != "" {  //If nickname is not empty
                    Auth.auth().createUser(withEmail: email!, password: password!, completion:{ (user,error) in
                    
                        if user != nil
                        {
                            //Sign Up Succesful
                            self.labelError.textColor = UIColor.green
                            self.labelError.text = "User register succesful"
                            self.segmentLog.selectedSegmentIndex = 0
                            self.buttonLogin.setTitle("LOGIN", for: .normal)
                            // **************************
                            
                            //Write user data in table utenti from database
                            
                            let ref = Database.database().reference() //Create reference with database
                   /*         let ref_user     = ref.child("Utenti/\(nickname)/email").setValue(email)
                            let ref_password = ref.child("Utenti/\(nickname)/password").setValue(password)
                    */
                            let ref_user     = ref.child("Utenti/\(user!.uid)/email").setValue(email)
                            
                            let ref_psw     = ref.child("Utenti/\(user!.uid)/password").setValue(password)
                            //End write
                            
                            self.nicknameText.isHidden = true
                        }
                        else
                        {
                            //Sign Up Failed
                            //Identify Error
                            if let myError = error?.localizedDescription
                            {
                                self.labelError.textColor = UIColor.red
                                self.labelError.text = myError
                                print(myError)
                            }
                            else
                            {
                                print ("ERROR")
                            }
                            
                        }
                    })  //Close authCreateUser
                }else{  //if nickname is empty
                    self.labelError.textColor = UIColor.red
                    self.labelError.text = "Username is empty"
                }
            }
        }
        else  //If the textbox are empty
        {
            self.labelError.textColor = UIColor.red
            self.labelError.text = "Textbox empty"
        }

    } //Close button pressed
    //End button pressed
    
    
    @IBAction func segmentChange(_ sender: UISegmentedControl) {
        if segmentLog.selectedSegmentIndex == 1
        {
            nicknameText.isHidden = false
            buttonLogin.setTitle("SIGN UP", for: .normal)
        }
        else
        {
            nicknameText.isHidden = true
            buttonLogin.setTitle("LOGIN", for: .normal)
        }
    }
    
    
    
    func login () {
        Auth.auth().signIn(withEmail: textEmail.text!, password: textPassword.text!, completion: { (user,error) in
            
            if (user != nil) && (error == nil)
            {
                //Login Successful
                self.performSegue(withIdentifier: "view2", sender: self) //Next view
                
            }
            else
            {
                //Login Error
                //Identify Error
                if let myError = error?.localizedDescription
                {
                    print(myError)
                    self.labelError.textColor = UIColor.red
                    self.labelError.text = myError
                    
                }
                else
                {
                    print ("ERROR")
                }
                
            }
        })
    }
    
    
    
    //Check if there are any empty text bots
    func textsBoxEmpty () -> Bool {
        if (textPassword.text == "") || (textEmail.text == "") {
            return true
        }
        return false
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
