//
//  ViewController.swift
//  Counter
//
//  Created by Anastasiya Dukhan on 09/08/2023.
//

import UIKit

class ViewController: UIViewController {
    
    var counter = 0
    
    @IBOutlet weak var jump_times: UITextView!
    @IBOutlet weak var exhausted_rabbit: UITextView!
    @IBOutlet weak var plus_one_button: UIButton!
    @IBOutlet weak var minus_one_button: UIButton!
    @IBOutlet weak var rabbit: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        jump_times.text = "\(counter) times"
        exhausted_rabbit.textColor = .black
        exhausted_rabbit.layer.opacity = 0
        disableMunisOneButton()
        rabbit.isHidden = true
    }
    
     
    @IBAction func plusOne(_ sender: Any) {
        switch(counter){
        case 5:
            exhausted_rabbit.layer.opacity = 100
            counter += 1
            jump_times.text = "\(counter) times"
            disablePlusOneButton()
        case 0:
            counter += 1
            jump_times.text = "\(counter) times"
            enableMunisOneButon()
            jump()
        default :
            counter += 1
            jump_times.text = "\(counter) times"
            jump()
        }
    }
    
    @IBAction func munisOne(_ sender: Any) {
        switch(counter){
        case 1 :
            counter -= 1
            jump_times.text = "\(counter) times"
            disableMunisOneButton()
        
        case 6 :
            counter -= 1
            jump_times.text = "\(counter) times"
            enablePlusOneButton()
            exhausted_rabbit.layer.opacity = 0
            jump()
        
        default:
            counter -= 1
            jump_times.text = "\(counter) times"
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
        plus_one_button.isEnabled = true
        plus_one_button.currentImage?.withTintColor(.black)
    }
    
    func disablePlusOneButton(){
        plus_one_button.isEnabled = false
        plus_one_button.currentImage?.withTintColor(.gray)
    }
    
    func enableMunisOneButon (){
        minus_one_button.isEnabled = true
        minus_one_button.currentImage?.withTintColor(.black)
    }
    
    func disableMunisOneButton (){
        minus_one_button.isEnabled = false
        minus_one_button.currentImage?.withTintColor(.gray)
    }

}

