//
//  ViewController.swift
//  Instagrid
//
//  Created by Bilal Dallali on 14/11/2023.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var instagridFont: UILabel!
    @IBOutlet weak var swipeUpFont: UILabel!
    @IBOutlet weak var swipeLeftFont: UILabel!
    
    
    @IBOutlet weak var selected1: UIImageView!
    @IBOutlet weak var selected2: UIImageView!
    @IBOutlet weak var selected3: UIImageView!
    
    @IBOutlet weak var middleView1: UIView!
    @IBOutlet weak var middleView2: UIView!
    @IBOutlet weak var middleView3: UIView!
    @IBOutlet weak var middleView4: UIView!
    
    var currentImage1 = UIImage.self
    
    @IBOutlet weak var plusMiddleView1: UIImageView!
    @IBOutlet weak var plusMiddleView2: UIImageView!
    @IBOutlet weak var plusMiddleView3: UIImageView!
    @IBOutlet weak var plusMiddleView4: UIImageView!
    
    @IBOutlet weak var plusMiddleViewTop: UIImageView!
    @IBOutlet weak var plusMiddleViewBottom: UIImageView!
    
    var selectedView: UIView?
    
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
        instagridFont.font = UIFont(name: "ThirstySoftRegular", size: 30)
        swipeUpFont.font = UIFont(name: "Delm-Medium", size: 26)
        swipeLeftFont.font = UIFont(name: "Delm-Medium", size: 26)
        setLayer1()
        
        setupTapGesture(for: middleView1, action: #selector(viewTapped))
        setupTapGesture(for: middleView2, action: #selector(viewTapped))
        setupTapGesture(for: middleView3, action: #selector(viewTapped))
        setupTapGesture(for: middleView4, action: #selector(viewTapped))

    }
    
    
    func setupTapGesture(for view: UIView, action: Selector) {
        let tapGesture = UITapGestureRecognizer(target: self, action: action)
        view.addGestureRecognizer(tapGesture)
        view.isUserInteractionEnabled = true
    }
    
    func resetLayers() {
        middleView1.frame = CGRect(x: middleView1.frame.origin.x, y: middleView1.frame.origin.y, width: 127.5, height: middleView1.frame.size.height)
        middleView3.frame = CGRect(x: middleView3.frame.origin.x, y: middleView3.frame.origin.y, width: 127.5, height: middleView3.frame.size.height)
        middleView2.isHidden = false
        middleView4.isHidden = false
        
//        middleView2.isUserInteractionEnabled = true
//        middleView4.isUserInteractionEnabled = true
        
        plusMiddleViewTop.layer.opacity = 0
        plusMiddleViewBottom.layer.opacity = 0
        plusMiddleView1.layer.opacity = 1
        plusMiddleView2.layer.opacity = 1
        plusMiddleView3.layer.opacity = 1
        plusMiddleView4.layer.opacity = 1
        
        // Ajuster la taille des images pour toutes les middleViews
        adjustImportedImageSize(in: middleView1)
        adjustImportedImageSize(in: middleView2)
        adjustImportedImageSize(in: middleView3)
        adjustImportedImageSize(in: middleView4)
    }
    
    func setLayer1() {
        resetLayers()
        selected1.layer.opacity = 1
        selected2.layer.opacity = 0
        selected3.layer.opacity = 0
        
        middleView1.frame = CGRect(x: middleView1.frame.origin.x, y: middleView1.frame.origin.y, width: 270, height: middleView1.frame.size.height)
        
        adjustImportedImageSize(in: middleView1)
        
        plusMiddleViewTop.layer.opacity = 1
        middleView2.isHidden = true
        //middleView2.isUserInteractionEnabled = true
        plusMiddleView1.layer.opacity = 0
        plusMiddleViewBottom.layer.opacity = 0
    }
    
    func setLayer2() {
        resetLayers()
        selected1.layer.opacity = 0
        selected2.layer.opacity = 1
        selected3.layer.opacity = 0
        
        
        middleView3.frame = CGRect(x: middleView3.frame.origin.x, y: middleView3.frame.origin.y, width: 270, height: middleView3.frame.size.height)
        adjustImportedImageSize(in: middleView3)
        plusMiddleView3.layer.opacity = 0
        plusMiddleView4.layer.opacity = 0
        plusMiddleViewBottom.layer.opacity = 1
        
        middleView4.isHidden = true
        //middleView4.isUserInteractionEnabled = true
    }
    
    func adjustImportedImageSize(in view: UIView) {
        for subview in view.subviews {
            if let imageView = subview as? UIImageView, imageView.tag == 100 {
                imageView.frame = view.bounds
            }
        }
    }
    
    @objc func viewTapped(gesture: UITapGestureRecognizer) {
        if let view = gesture.view {
            selectedView = view
            importPicture()
        }
    }
    
    func importPicture() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker, animated: true)
    }
    
}

extension ViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage, let view = selectedView {
            // CRéer imageView
            let imageView = UIImageView(image: selectedImage)
            imageView.contentMode = .scaleAspectFit //scaleAspectFit
            imageView.clipsToBounds = true
            //(selectedView?.subviews.first as? UIImageView)?.image = selectedImage
            
            //Ajuster la taille et position de l'imageView
            imageView.frame = view.bounds
            imageView.tag = 100
            view.addSubview(imageView)
            
            //Ajouter l'imageView comme sous-vue de la middleView
            view.addSubview(imageView)
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
