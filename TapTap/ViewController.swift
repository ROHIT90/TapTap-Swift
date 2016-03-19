//
//  ViewController.swift
//  TapTap
//
//  Created by rohit FNU on 3/17/16.
//  Copyright © 2016 rohit FNU. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    //outlets
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var howMnayTapsTextFiewld: UITextField!
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var tapButton: UIButton!
    @IBOutlet weak var tabLabel: UILabel!
    
    
    //variables
    var maxTaps = 0
    var currentTaps = 0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        howMnayTapsTextFiewld.delegate = self
        self.addDoneButtonOnKeyboard()
    }
    
    @IBAction func playButtonTouchUpInside(sender: UIButton!)
    {

        if (howMnayTapsTextFiewld.text != nil && howMnayTapsTextFiewld.text != ""){
            
            logoImageView.hidden = true
            playButton.hidden = true
            howMnayTapsTextFiewld.hidden = true
            
            tapButton.hidden = false
            tabLabel.hidden = false
            
            maxTaps = Int(howMnayTapsTextFiewld.text!)!
            currentTaps = 0
            
            updateTapLabel()
        }
    }
    
    @IBAction func tapButtonTouchUpInside (sender : UIButton!)
    {
        currentTaps++
        updateTapLabel()
        if isGameOver() {
            restartGame()
        }
    }
    
    func updateTapLabel()
    {
        tabLabel.text = "\(currentTaps) Taps"

    }
    
    func isGameOver() -> Bool {
        if currentTaps >= maxTaps {
            return true
        } else {
            return false
        }
    }
    
    func restartGame()
    {
        maxTaps = 0
        howMnayTapsTextFiewld.text = ""
        
        logoImageView.hidden = false
        playButton.hidden = false
        howMnayTapsTextFiewld.hidden = false
        
        tapButton.hidden = true
        tabLabel.hidden = true
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
    textField.resignFirstResponder()
    return true
    }
    
    func addDoneButtonOnKeyboard()
    {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRectMake(0, 0, 320, 50))
        doneToolbar.barStyle = UIBarStyle.BlackTranslucent
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Done, target: self, action: Selector("doneButtonAction"))
        
        let items = NSMutableArray()
        items.addObject(flexSpace)
        items.addObject(done)
        
        doneToolbar.items = [done]
        doneToolbar.sizeToFit()
        
        self.howMnayTapsTextFiewld.inputAccessoryView = doneToolbar
    }
    
    func doneButtonAction()
    {
        self.howMnayTapsTextFiewld.resignFirstResponder()
    }
}

