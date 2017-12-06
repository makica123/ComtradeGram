//
//  CommentsViewController.swift
//  CoreDataTutorialPart1Final
//
//  Created by Predrag Jevtic on 12/4/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import UIKit

class CommentsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    var photo:Photo?
    var tableView: UITableView?
    var commentTxt: UITextField?
    var commentsList = [Comment]()

    let inputFormHeight:CGFloat = 60.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGray

        self.commentsList.append(Comment.init(text: "Here is my comment", date: Date()))

        self.tableView = UITableView.init(frame:
            CGRect.init(
                x: 0,
                y: 0,
                width: self.view.frame.size.width,
                height: self.view.frame.size.height - 110))
        
        //        self.view.addSubview(self.tableView!)
        tableView!.register(CommentCell.self, forCellReuseIdentifier: "commentCell")
        self.tableView?.delegate = self

        // Do any additional setup after loading the view.
        self.tableView?.reloadData()

        self.setupCommentForm()

        NotificationCenter.default.addObserver(self, selector: Selector(("keyboardWillShow:")), name: NSNotification.Name.UIKeyboardWillShow, object: nil)

        NotificationCenter.default.addObserver(self, selector: Selector(("keyboardWillHide:")), name: NSNotification.Name.UIKeyboardWillHide, object: nil)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: - Input Form for New Comment

    func setupCommentForm(){

        let viewContainer = UIView.init(frame: CGRect.init(x: 0, y: self.view.frame.size.height - 110, width: self.view.frame.size.width, height: self.inputFormHeight))
        viewContainer.backgroundColor = UIColor.init(white: 1, alpha: 1)

        self.commentTxt = UITextField()
        self.commentTxt?.delegate = self
        self.commentTxt?.frame = CGRect.init(x: 10, y: 5, width: self.view.frame.size.width * 0.8, height: self.inputFormHeight - 10)
        self.commentTxt?.placeholder = "Add your comment"

        viewContainer.addSubview(commentTxt!)

        let btn = UIButton.init(frame: CGRect.init(x: self.view.frame.size.width - 70, y: 5, width: 60, height: self.inputFormHeight - 10))

        btn.setTitle("Add", for: UIControlState.normal)
        btn.setTitleColor(UIColor.red, for: .normal)
        viewContainer.addSubview(btn)

        self.view.addSubview(viewContainer)

        btn.addTarget(self, action: #selector(storeComment(_:)), for: .touchUpInside)

    }
    @objc func storeComment(_ sender: AnyObject){
        let commentText = self.commentTxt?.text
// add new comment into list of comment
        self.commentsList.append(Comment.init(text: commentText!, date: Date()))

        print(commentText!)
        print(self.commentsList)

        self.commentTxt?.text = ""
        self.commentTxt?.resignFirstResponder()
    }
    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */

    //MARK: - UITableView Delegates
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.commentsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentsCell", for: indexPath) as! CommentCell

        let comment = self.commentsList[indexPath.row]

        print(comment)

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        //        let comment = self.commentsList[indexPath.row]
    }

    //MARK: - UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.storeComment(textField)
        return true
    }

    //MARK: - Keyboard notification methods

    func keyboardWillShow(_ selector: NSNotification){
        if let keyboardSize = selector.userInfo!["UIKeyboardBoundsUserInfoKey"] as? CGRect {
            let height = keyboardSize.size.height

            UIView.animate(withDuration: 0.5, animations: {
                self.view.center = CGPoint.init(x: self.view.center.x, y: self.view.center.y - height + 50)

            }, completion: nil)

        }
        print(selector)
    }
    func keyboardWillHide(_ selector: NSNotification){
        if (selector.userInfo!["UIKeyboardBoundsUserInfoKey"] as? CGRect) != nil {
            UIView.animate(withDuration: 0.5, animations: {
                self.view.center = CGPoint.init(x: self.view.center.x, y: self.view.frame.size.height / 2)

            }, completion: nil)

        }
    }
}
