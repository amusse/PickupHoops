//
//  PasswordVC.swift
//  PickupHoops
//
//  Created by Ahmed Musse on 12/25/15.
//  Copyright © 2015 Pickup Sports. All rights reserved.
//

import UIKit
import Parse

class PasswordVC: UIViewController {
    
    @IBOutlet weak var tbPassword: UITextField!
    var firstName   = ""
    var lastName    = ""
    var userName    = ""
    var email       = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let logo = UIImage(named: "basketball-nav-bar-2.png")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
        tbPassword.becomeFirstResponder()
    }
    
    // Dismiss the keyboard after touching anywhere on screen
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?)
    {
        self.view.endEditing(true)
    }
    
    func displayAlert()
    {
        // Alert that a confirmation email has been sent
        let alertController = UIAlertController(
            title: "Invalid Password!",
            message: "Sorry, you've entered an invalid password. Please re-read the password requirements and try again.",
            preferredStyle: UIAlertControllerStyle.Alert
        )
        
        alertController.addAction(UIAlertAction(title: "OK",
            style: UIAlertActionStyle.Default,
            handler: { (alert: UIAlertAction!) in print("Invalid Password")}))
        
        // Display alert
        self.presentViewController(
            alertController,
            animated: true,
            completion: nil)
    }
    
    @IBAction func btnNext(sender: AnyObject)
    {
        if (passwordIsValid(tbPassword.text!))
        {
            self.performSegueWithIdentifier("toVerifyPasswordVC", sender: self)
        }
        else
        {
            displayAlert()
        }
    }
    
    // Perform a segue after hitting "Next" on the keyboard
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        if (passwordIsValid(textField.text!))
        {
            self.performSegueWithIdentifier("toVerifyPasswordVC", sender: self)
        }
        else
        {
            displayAlert()
        }
        return true
    }
    
    // Checks if email is valid
    func passwordIsValid(username: NSString) -> Bool
    {
        return true
    }
    
    // Send previous data to next view controller
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let nextVC = segue.destinationViewController as! VerifyPasswordVC
        nextVC.firstName    = firstName
        nextVC.lastName     = lastName
        nextVC.userName     = userName
        nextVC.email        = email
        nextVC.password     = tbPassword.text!
    }

    
    override func viewWillDisappear(animated: Bool)
    {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBarHidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}