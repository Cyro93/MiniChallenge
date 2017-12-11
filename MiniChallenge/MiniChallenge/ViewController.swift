//
//  ViewController.swift
//  MiniChallenge
//
//  Created by Ciro Esposito on 11/12/17.
//  Copyright © 2017 MindBlowers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelOne: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let v1 = kk()
        let v2 = tt()
        labelOne.text  = String(sum(tt: v2, kk: v1))
        // Do any additional setup after loading the view, typically from a nib.
    }

    func kk () -> Int {
        let a  = 3
        return a
    }
    
    func tt () -> Int {
        let lol = 5
        return lol
    }
    
    
    func sum (tt:Int, kk:Int  ) -> Int {
        return tt + kk
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

