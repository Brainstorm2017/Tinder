//
//  ViewController.swift
//  Tinder
//
//  Created by user144166 on 11/14/18.
//  Copyright © 2018 Codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func Pangesture(_ sender: Any) {
    
    
    
    
    
    }
    
    var trayOriginalCenter: CGPoint!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBOutlet var trayView: UIView!
    
    @IBAction func Swipecontrol(_ sender: UIPanGestureRecognizer) {
        view.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        view.transform = view.transform.scaledBy(x: 0.5, y: 0.5)
        
        view.transform = view.transform.rotated(by:rotation)
        
        view.transform = view.transform.rotated(by angle: CGFloat(45 * M_PI / 180))
        view.transform = CGAffineTransform(translationX: 50, y: 50)
        
        view.transform = CGAffineTransform(translationX: 50, y: 50)
        view.transform = view.transform.translatedBy(x: 10, y: 10)
        
        view.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        view.transform = view.transform.rotated(by angle: CGFloat(45 * M_PI / 180))
        
        view.transform = CGAffineTransform.identity
        
        
        
        self.firstView.alpha = 0
        self.secondView.alpha = 1
        UIView.animate(withDuration:0.4, animations: {
            // This causes first view to fade in and second view to fade out
            self.firstView.alpha = 1
            self.secondView.alpha = 0
        }
            
            UIView.animate(withDuration: 0.3, animations: {
                // Animate view properties here...
            }) { (Bool) in
                // Code to run after animation has finished...
        }
        
    }
    UIView.animate(withDuration:0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options:[] ,
    animations: { () -> Void in
    self.trayView.center = self.trayDown
    }, completion: nil)
    
    cardView.transform = CGAffineTransformIdentity
}




override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    var photoViewController = segue.destination as! PhotoViewController
    
    photoViewController.image = self.imageView.image
}

