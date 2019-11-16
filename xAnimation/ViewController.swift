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
    
    // MARK: - Actions
    
    @IBAction func startBtnPressed(_ sender: UIButton) {
        isHiddenNow.toggle()
        x3Lbl.isHidden = isHiddenNow
        
        print("Running spring animation from button")
        x3Lbl.center = self.view.center

        self.x3Lbl.transform = CGAffineTransform(scaleX: 0.0001, y: 0.0001)
        UIView.animate(withDuration: 3.0, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: [], animations: {
            self.x3Lbl.transform = .identity
        }, completion: nil)
    }
    
    @objc func springBtnPressed(){
        print("Running spring animation")
        x3Lbl.center = self.view.center

        self.x3Lbl.transform = CGAffineTransform(scaleX: 0.0001, y: 0.0001)
        UIView.animate(withDuration: 3.0, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: [], animations: {
            self.x3Lbl.transform = .identity
        }, completion: nil)
        
    }
    
    // MARK: - VC Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        x3Lbl.isHidden = isHiddenNow
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(springBtnPressed))
        tap.numberOfTouchesRequired = 3
        x3Lbl.addGestureRecognizer(tap)
    }


}

