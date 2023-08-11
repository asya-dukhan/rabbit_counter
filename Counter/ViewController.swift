//
//  ViewController.swift
//  Counter
//
//  Created by Anastasiya Dukhan on 09/08/2023.
//

import UIKit

class ViewController: UIViewController {
    
    var counter = 0
    @IBOutlet weak var exhaustedRabbit: UILabel!
    @IBOutlet weak var jumpTimes: UILabel!
    @IBOutlet weak var plusOneButton: UIButton!
    @IBOutlet weak var minusOneButton: UIButton!
    @IBOutlet weak var rabbit: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        jumpTimes.text = "\(counter) times"
        exhaustedRabbit.textColor = .black
        exhaustedRabbit.layer.opacity = 0
        disableMunisOneButton()
        rabbit.isHidden = true
    }
    
     
    @IBAction func plusOne(_ sender: Any) {
        switch(counter){
        case 5:
            exhaustedRabbit.layer.opacity = 100
            counter += 1
            jumpTimes.text = "\(counter) times"
            disablePlusOneButton()
        case 0:
            counter += 1
            jumpTimes.text = "\(counter) times"
            enableMunisOneButon()
            jump()
        default :
            counter += 1
            jumpTimes.text = "\(counter) times"
            jump()
        }
    }
    
    @IBAction func munisOne(_ sender: Any) {
        switch(counter){
        case 1 :
            counter -= 1
            jumpTimes.text = "\(counter) times"
            disableMunisOneButton()
        
        case 6 :
            counter -= 1
            jumpTimes.text = "\(counter) times"
            enablePlusOneButton()
            exhaustedRabbit.layer.opacity = 0
            jump()
        
        default:
            counter -= 1
            jumpTimes.text = "\(counter) times"
            jump()
        }
        
    }
    
    func jump(){
        let repeatCount = CGFloat(counter)
        let height = view.bounds.size.height
        disablePlusOneButton()
        disableMunisOneButton()
        rabbit.isHidden = false
        
        UIView.animate(withDuration: 0.8, delay: 0, options: [], animations: {
            UIView.modifyAnimations(withRepeatCount: repeatCount, autoreverses: true, animations: {
                self.rabbit.frame.origin.y -= height/2
            })
        }){ (finished) in
            self.enableMunisOneButon()
            self.enablePlusOneButton()
            self.rabbit.isHidden = true
        }
            
    }
    
    func enablePlusOneButton (){
        plusOneButton.isEnabled = true
        plusOneButton.currentImage?.withTintColor(.black)
    }
    
    func disablePlusOneButton(){
        plusOneButton.isEnabled = false
        plusOneButton.currentImage?.withTintColor(.gray)
    }
    
    func enableMunisOneButon (){
        minusOneButton.isEnabled = true
        minusOneButton.currentImage?.withTintColor(.black)
    }
    
    func disableMunisOneButton (){
        minusOneButton.isEnabled = false
        minusOneButton.currentImage?.withTintColor(.gray)
    }

}

