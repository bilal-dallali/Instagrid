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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        selected2.layer.opacity = 0
        selected3.layer.opacity = 0

    }


}
