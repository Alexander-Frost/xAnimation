//
//  ViewController.swift
//  xAnimation
//
//  Created by Alex on 11/15/19.
//  Copyright © 2019 Alex. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties
    
    var isHiddenNow: Bool = true
    
    // MARK: - Outlets
    
    @IBOutlet weak var x3Lbl: UILabel!
    var messageLabel = UILabel()
    
    // MARK: - Actions
    
    @IBAction func startBtnPressed(_ sender: UIButton) {
        runAnimation()
    }
    
    @objc func springBtnPressed(){
        runAnimation()
    }
    
    // MARK: - VC Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }

    // MARK: - Animation
    
    private func runAnimation(){
        isHiddenNow.toggle()
        messageLabel.isHidden = isHiddenNow
        
        print("Running spring animation from button")
        messageLabel.center = self.view.center

        self.messageLabel.transform = CGAffineTransform(scaleX: 0.0001, y: 0.0001)
        UIView.animate(withDuration: 3.0, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: [], animations: {
            self.messageLabel.transform = .identity
        }, completion: nil)
    }
    // MARK: - Setup UI
    
    private func setupUI(){
        x3Lbl.isHidden = true
        
        // Message Label
        messageLabel.text = "x4"
        messageLabel.font = UIFont(name: "Marker Felt", size: 80)
        messageLabel.isHidden = isHiddenNow
        messageLabel.sizeToFit()
        messageLabel.textColor = #colorLiteral(red: 0.2784313725, green: 0.8862745098, blue: 0.8078431373, alpha: 1)
        messageLabel.center = self.view.center
        
        // Gesture Recognizer
        let tap = UITapGestureRecognizer(target: self, action: #selector(springBtnPressed))
        tap.numberOfTouchesRequired = 3
        messageLabel.addGestureRecognizer(tap)
     
        view.addSubview(messageLabel)
    }

}

