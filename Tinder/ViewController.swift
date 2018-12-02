//
//  ViewController.swift
//  Tinder
//
//  Created by user144166 on 11/14/18.
//  Copyright © 2018 Codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cardImageView: UIImageView!
    var cardInitialCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardImageView.image = #imageLiteral(resourceName: "ryan")
        cardImageView.layer.cornerRadius = 10.0
        
    }
    
    
    @IBAction func Pangesture(_ sender: Any) {
    
    
    }
    
            
            
            
    var trayOriginalCenter: CGPoint!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBOutlet var trayView: UIView!
    
    @IBAction func Swipecontrol(_ sender: UIPanGestureRecognizer) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPanCard(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        
        if sender.state == .began {
            print("Gesture began")
            cardInitialCenter = cardImageView.center
        } else if sender.state == .changed {
            print("Gesture is changing")
            var angle = 0.0
            if (translation.x > 0) {
                if (translation.x < 15) {
                    angle = Double(translation.x)
                } else {
                    angle = 15.0
                }
                cardImageView.transform = CGAffineTransform(rotationAngle: CGFloat(angle * Double.pi / 180))
                cardImageView.center = CGPoint(x: cardInitialCenter.x + translation.x, y:cardInitialCenter.y)
            } else {
                if (translation.x > -15) {
                    angle = Double(translation.x)
                } else {
                    angle = -15.0
                }
                cardImageView.transform = CGAffineTransform(rotationAngle: CGFloat(angle * Double.pi / 180))
                cardImageView.center = CGPoint(x: cardInitialCenter.x + translation.x, y:cardInitialCenter.y)
            }
        } else if sender.state == .ended {
            print("Gesture ended")
            
            if (translation.x > 100) {
                UIView.animate(withDuration:0.4, delay: 0.0,
                               options: [],
                               animations: { () -> Void in
                                self.cardImageView.transform = CGAffineTransform(translationX: 500, y: 0)
                }, completion: nil)
            } else if (translation.x < -100) {
                UIView.animate(withDuration:0.4, delay: 0.0,
                               options: [],
                               animations: { () -> Void in
                                self.cardImageView.transform = CGAffineTransform(translationX: -500, y: 0)
                }, completion: nil)
            } else {
                cardImageView.transform = CGAffineTransform.identity
            }
            
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationViewController = segue.destination as! ProfileViewController
        destinationViewController.image = self.cardImageView.image
    }
    
    
}


class ProfileViewController: UIViewController {
    
    
    @IBOutlet weak var profileImageView: UIImageView!
    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImageView.layer.cornerRadius = 10.0
        profileImageView.image = image
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTap(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
