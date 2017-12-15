//
//  ProfileScene.swift
//  MiniChallenge
//
//  Created by Ciro Esposito on 14/12/17.
//  Copyright © 2017 MindBlowers. All rights reserved.
//

import UIKit

class ProfileScene: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
   
   
    @IBOutlet weak var imageProfile: UIButton!
    @IBAction func imageProfile(_ sender: UIButton) {
        
        
        let controller = UIImagePickerController()
        controller.delegate = self
        controller.sourceType = .photoLibrary
        present(controller, animated: true, completion: nil)
    }
    
    @IBOutlet weak var bioView: UIView!
    @IBOutlet weak var statsView: UIView!
    @IBOutlet weak var favouritesView: UIView!
    
    @IBAction func changeView(_ sender: UISegmentedControl) {
        
        switch  sender.selectedSegmentIndex {
        case 0:
            
            bioView.isHidden = false
            statsView.isHidden = true
            favouritesView.isHidden = true
            
        case 1:
            
            bioView.isHidden = true
            statsView.isHidden = false
            favouritesView.isHidden = true
            
        case 2:
            
            bioView.isHidden = true
            statsView.isHidden = true
            favouritesView.isHidden = false
            
        default:
            break
        }
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        
        dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
        
        let image = info[UIImagePickerControllerOriginalImage ] as! UIImage
        
        imageProfile.setImage(image, for: .normal)
        
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
  /*  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let controller = UIImagePickerController()
        controller.delegate = self
        controller.sourceType = .photoLibrary
        present(controller, animated: true, completion: nil)
    } */


}
