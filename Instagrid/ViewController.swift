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
    
    @IBOutlet weak var middleView1: UIView!
    @IBOutlet weak var middleView2: UIView!
    @IBOutlet weak var middleView3: UIView!
    @IBOutlet weak var middleView4: UIView!
    
    @IBOutlet weak var plusMiddleView1: UIImageView!
    @IBOutlet weak var plusMiddleView2: UIImageView!
    @IBOutlet weak var plusMiddleView3: UIImageView!
    @IBOutlet weak var plusMiddleView4: UIImageView!
    
    @IBOutlet weak var plusMiddleViewTop: UIImageView!
    @IBOutlet weak var plusMiddleViewBottom: UIImageView!
    
    
    @IBAction func selectLayout1(_ sender: UIButton) {
        //sender.isSelected = true
        //sender.isSelected.toggle()
        selected1.layer.opacity = 1
        selected2.layer.opacity = 0
        selected3.layer.opacity = 0
        setLayer1()
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
        setLayer1()
    }
    
    func setLayer1() {
        selected2.layer.opacity = 0
        selected3.layer.opacity = 0
        middleView1.frame = CGRect(x: middleView1.frame.origin.x, y: middleView1.frame.origin.y, width: 270, height: middleView1.frame.size.height)
        middleView2.layer.opacity = 0
        plusMiddleView1.layer.opacity = 0
        plusMiddleViewBottom.layer.opacity = 0
    }
    
}
