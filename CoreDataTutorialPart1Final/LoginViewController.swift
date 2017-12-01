//
//  LoginViewController.swift
//  CoreDataTutorialPart1Final
//
//  Created by Predrag Jevtic on 11/27/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    var usernameTxt: UITextField!
    var passwordTxt: UITextField!
    var sendBttn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Login"
        view.backgroundColor = .white
        
        let btn = UIButton.init(type: .custom)
        btn.titleLabel?.textAlignment = NSTextAlignment.center
        
        self.usernameTxt = UITextField.init(frame: CGRect.init(x: 50, y: 120, width: 200, height: 50))
        self.usernameTxt.placeholder = "Put some name here"
        
        self.view.addSubview(usernameTxt)
        
        self.passwordTxt = UITextField.init(frame: CGRect.init(x: 50, y: 180, width: 200, height: 50))
        self.passwordTxt.delegate = self
        self.passwordTxt.placeholder = "Your password please"
        self.passwordTxt.isSecureTextEntry = true
        self.passwordTxt.returnKeyType = UIReturnKeyType.send
        
        self.view.addSubview(self.passwordTxt)
        // Do any additional setup after loading the view.
        
        self.sendBttn = UIButton.init(frame: CGRect.init(x: 50, y: 250, width: 300, height: 50))
        self.sendBttn.setTitle("Send", for: UIControlState.normal)
        self.sendBttn.backgroundColor = UIColor.lightGray
        
        self.sendBttn.addTarget(self, action: #selector(submitLogin(_:)), for:.touchUpInside)
        
        self.view.addSubview(self.sendBttn)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // 1. check if email/username text is empty
        // 2. check if password is empty
        // 3. show alert view controller with message: Missing username/password
        
        // 4. if form is valid, execute segue to photos table view (posts)

        textField.resignFirstResponder()
        
        self.submitLogin(textField)
        
        return true
    }
    
    func submitLogin(_ sender: Any){
        let photoVC = PhotoVC()
        
        self.present(photoVC, animated: true, completion: nil)
    }
}
