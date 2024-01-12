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
    
    
    @IBOutlet weak var mainMiddleview: UIView!
    
    @IBOutlet weak var mainView: UIView!
    var selectedView: UIView?
    
    @IBAction func selectLayout1(_ sender: UIButton) {
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
        
        // Add to view hierarchy
        view.addSubview(mainView)
        
        // Initialize swipe gesture recognizer
        let swipeUpGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe(_:)))
        
        // Configure swipe gesture recognizer
        swipeUpGestureRecognizer.direction = .up
        
        //Add swipe gesture recognizer
        mainView.addGestureRecognizer(swipeUpGestureRecognizer)
        
        // Initialize swipe gesture recognizer
        let swipeLeftGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe(_:)))
        
        // Configure swipe gesture recognizer
        swipeLeftGestureRecognizer.direction = .left
        
        //Add swipe gesture recognizer
        mainView.addGestureRecognizer(swipeLeftGestureRecognizer)
        
        updateGestureRecognizers()
        
        
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: { _ in
            self.updateGestureRecognizers()
        }, completion: nil)
    }
    
    
    private func updateGestureRecognizers() {
        let isLandscape = UIDevice.current.orientation.isLandscape
        mainView.gestureRecognizers?.forEach { gestureRecognizer in
            if let swipeGesture = gestureRecognizer as? UISwipeGestureRecognizer {
                switch swipeGesture.direction {
                case .up:
                    swipeGesture.isEnabled = !isLandscape
                case .left:
                    swipeGesture.isEnabled = isLandscape
                default:
                    break
                }
            }
        }
    }
    
    @objc private func didSwipe(_ sender: UISwipeGestureRecognizer) {
        
        // Check the presence of image in middleViews
        let hasImageInMiddleView1 = middleView1.subviews.contains(where: { $0 is UIImageView && $0.tag == 100 })
        let hasImageInMiddleView3 = middleView3.subviews.contains(where: { $0 is UIImageView && $0.tag == 100 })
        
        if hasImageInMiddleView1 && hasImageInMiddleView3 {
            // fix size for screenshot
            let fixedSize = CGSize(width: 300, height: 300)
            let renderer = UIGraphicsImageRenderer(size: fixedSize)
            let image = renderer.image { ctx in
                // Resize mainMiddleView temporarily to render
                let originalFrame = mainMiddleview.frame
                mainMiddleview.frame = CGRect(origin: originalFrame.origin, size: fixedSize)
                mainMiddleview.drawHierarchy(in: CGRect(origin: .zero, size: fixedSize), afterScreenUpdates: true)
                mainMiddleview.frame = originalFrame
            }
            
            // Share the screenshot
            DispatchQueue.main.async {
                let activityViewController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
                // iPad configuration
                if let popoverController = activityViewController.popoverPresentationController {
                    popoverController.sourceView = self.view
                    popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
                    popoverController.permittedArrowDirections = []
                }
                self.present(activityViewController, animated: true, completion: nil)
            }
        } else {
            // error pop up
            let alert = UIAlertController(title: "Error", message: "You must add images", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            DispatchQueue.main.async {
                self.present(alert, animated: true, completion: nil)
            }
        }
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
        
        plusMiddleViewTop.layer.opacity = 0
        plusMiddleViewBottom.layer.opacity = 0
        plusMiddleView1.layer.opacity = 1
        plusMiddleView2.layer.opacity = 1
        plusMiddleView3.layer.opacity = 1
        plusMiddleView4.layer.opacity = 1
        
        // Adjust the image size for all the middleViews
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
    }
    
    func adjustImportedImageSize(in view: UIView) {
        for subview in view.subviews {
            if let imageView = subview as? UIImageView, imageView.tag == 100 {
                imageView.frame = view.bounds
            }
        }
    }
    
    func removeAllImportedImages() {
        plusMiddleViewTop.isHidden = false
        plusMiddleViewBottom.isHidden = false
        let middleViews = [middleView1, middleView2, middleView3, middleView4]
        
        for middleView in middleViews {
            // Delete all subviews
            middleView?.subviews.forEach { subview in
                if subview.tag == 100 {
                    subview.removeFromSuperview()
                }
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
            // Delete the older image
            view.subviews.forEach { subview in
                if subview is UIImageView && subview.tag == 100 {
                    subview.removeFromSuperview()
                }
            }
            // Create ImageView
            let imageView = UIImageView(image: selectedImage)
            imageView.contentMode = .scaleAspectFit //scaleAspectFit
            imageView.clipsToBounds = true
            
            //Adjust size and position imageView
            imageView.frame = view.bounds
            imageView.tag = 100
            view.addSubview(imageView)
            
            // Add imageVieww as subview of the middleView
            view.addSubview(imageView)
            
            // Hide plusMiddleViewTop if image is added to middleView1
            if view == middleView1 {
                plusMiddleViewTop.isHidden = true
            }
            
            // Hide plusMiddleViewBottom if the image is added at middleView3
            if view == middleView3 {
                plusMiddleViewBottom.isHidden = true
            }
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
