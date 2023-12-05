//
//  ViewController.swift
//  Instagrid
//
//  Created by Bilal Dallali on 14/11/2023.
//

import UIKit
//import PhotosUI

class ViewController: UIViewController {
    
    @IBOutlet weak var selected1: UIImageView!
    @IBOutlet weak var selected2: UIImageView!
    @IBOutlet weak var selected3: UIImageView!
    
    @IBAction func selectLayout1(_ sender: UIButton) {
        //sender.isSelected = true
        //sender.isSelected.toggle()
        selected1.layer.opacity = 1
        selected2.layer.opacity = 0
        selected3.layer.opacity = 0
        
    }
    
    @IBAction func selectLayout2(_ sender: UIButton) {
        selected1.layer.opacity = 0
        selected2.layer.opacity = 1
        selected3.layer.opacity = 0
    }
    
    @IBAction func selectLayout3(_ sender: UIButton) {
        selected1.layer.opacity = 0
        selected2.layer.opacity = 0
        selected3.layer.opacity = 1
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        selected2.layer.opacity = 0
        selected3.layer.opacity = 0
    }
    
}
