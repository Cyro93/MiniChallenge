//
//  ViewController2.swift
//  MiniChallenge
//
//  Created by Michele Golino on 12/12/17.
//  Copyright © 2017 MindBlowers. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase


class ViewController2: UIViewController {

    //Declare object
    @IBOutlet weak var buttonSignOut: UIButton!
    @IBOutlet weak var labelUser: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    //End object
    
    
    @IBAction func signOutPressed(_ sender: Any) {
        sign_out()
        
        performSegue(withIdentifier: "view1", sender: self)
        
    }
    
    @IBAction func pressedDeleteBUTTON(_ sender: Any) {
        delete_account_auth()
        delete_table_account()
        performSegue(withIdentifier: "view1", sender: self) //Back view
        //dismiss(animated: true, completion: .normal)
    }
    
    
    
    func delete_table_account(){
        let ref = Database.database().reference()
        let user = "k"  //Username da cancellare
        ref.child("Utenti/\(user)").removeValue() //Delete table from database
    }
    
    func delete_account_auth () {
        Auth.auth().currentUser?.delete(completion: { (err) in
            
            print(err?.localizedDescription)
            self.labelUser.text = err?.localizedDescription
        })
    }
    
    
    
    func sign_out(){
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let emailCurrentUser = Auth.auth().currentUser?.email!
        labelUser.text = "Welcome \(emailCurrentUser!)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
