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
        
        setLayer1()
    }
    
    @IBAction func selectLayout2(_ sender: UIButton) {
        setLayer2()
    }
    
    @IBAction func selectLayout3(_ sender: UIButton) {
        selected1.layer.opacity = 0
        selected2.layer.opacity = 0
        selected3.layer.opacity = 1
        resetLayers()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setLayer1()
    }
    
    func resetLayers() {
        middleView1.frame = CGRect(x: middleView1.frame.origin.x, y: middleView1.frame.origin.y, width: 127.5, height: middleView1.frame.size.height)
        middleView3.frame = CGRect(x: middleView3.frame.origin.x, y: middleView3.frame.origin.y, width: 127.5, height: middleView3.frame.size.height)
        middleView2.layer.opacity = 1
        middleView4.layer.opacity = 1
        plusMiddleViewTop.layer.opacity = 0
        plusMiddleViewBottom.layer.opacity = 0
        plusMiddleView1.layer.opacity = 1
        plusMiddleView2.layer.opacity = 1
        plusMiddleView3.layer.opacity = 1
        plusMiddleView4.layer.opacity = 1
    }
    
    func setLayer1() {
        resetLayers()
        selected1.layer.opacity = 1
        selected2.layer.opacity = 0
        selected3.layer.opacity = 0
        
        middleView1.frame = CGRect(x: middleView1.frame.origin.x, y: middleView1.frame.origin.y, width: 270, height: middleView1.frame.size.height)
        plusMiddleViewTop.layer.opacity = 1
        middleView2.layer.opacity = 0
        plusMiddleView1.layer.opacity = 0
        plusMiddleViewBottom.layer.opacity = 0
    }
    
    func setLayer2() {
        resetLayers()
        selected1.layer.opacity = 0
        selected2.layer.opacity = 1
        selected3.layer.opacity = 0
        
        
        middleView3.frame = CGRect(x: middleView3.frame.origin.x, y: middleView3.frame.origin.y, width: 270, height: middleView3.frame.size.height)
        plusMiddleView3.layer.opacity = 0
        plusMiddleView4.layer.opacity = 0
        plusMiddleViewBottom.layer.opacity = 1
    }
    
}
