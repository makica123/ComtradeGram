//
//  LoginViewController.swift
//  CoreDataTutorialPart1Final
//
//  Created by Marija Grujic on 11/27/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    var textField: UITextField!
    var label:UILabel!
    var textField2: UITextField!
    var label2:UILabel!
    var button: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "LogIn"
        
      
     

        
        
        let view = UIView()
        view.backgroundColor = .yellow
        
        textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.text = "Username"
        textField.frame = CGRect.init(x: 17, y:130, width: 287, height: 30)
        textField.textColor = UIColor.gray
           textField.delegate = self
        
        button = UIButton()
        button.backgroundColor  = UIColor.yellow
        button.frame = CGRect.init(x: 55, y: 150, width: 180, height: 30)
        button.contentMode = .center
        button.setTitle("Press", for: UIControlState.normal)
        button.setTitleColor(UIColor.blue, for: UIControlState.normal)
        view.addSubview(button)
        
        view.addSubview(textField)
        
        textField2 = UITextField()
        textField2.borderStyle = .roundedRect
        textField2.frame = CGRect.init(x: 17, y:80, width: 287, height: 30)
        textField2.textColor = UIColor.gray
        textField2.text = "Password"
        textField2.isSecureTextEntry = true
        textField2.delegate = self
        textField2.returnKeyType = UIReturnKeyType.send
        view.addSubview(textField2)
        
        label = UILabel()
        view.addSubview(label)
        
        label2 = UILabel()
        view.addSubview(label2)
        
        self.view = view
        
        // Layout
        
        textField.translatesAutoresizingMaskIntoConstraints = false

        label.translatesAutoresizingMaskIntoConstraints = false
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: margins.topAnchor, constant: 20),
            textField.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            
            label.leadingAnchor.constraint(equalTo: textField.leadingAnchor),
            label.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 10),
            ])
        
        // Events
        
        button.addTarget(self, action: #selector(action), for: .touchUpInside)
        
        
            
        
       // textField.addTarget(self, action: #selector(updateLabel), for: UIControlEvents.editingChanged)
       //textField2.addTarget(self, action: #selector(updateLabel), for: UIControlEvents.editingChanged)
        
        //updateLabel()
    }
    
    
    
//    @objc func updateLabel() {
//        self.label.text = textField.text
        
    
//        //func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

//}
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        
        //1.check if email/username text is empty
        //2.check if password is empty
        //3. show alert view controller with message : Missing username/password
        //4. if form is valid, execute segue to photos table view
        
        textField.resignFirstResponder()
        
        self.action(sender:textField)
        return true
        
    }
    
    func action (sender:Any) {
       
        let photoVc = PhotoVC()//your view controller
        self.present(photoVc,animated: true,completion: nil)
}
    


}
