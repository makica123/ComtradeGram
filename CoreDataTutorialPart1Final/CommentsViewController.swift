//
//  CommentsViewController.swift
//  CoreDataTutorialPart1Final
//
//  Created by Predrag Jevtic on 12/4/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import UIKit

class CommentsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var photo:Photo?
    var tableView: UITableView?
    var commentsList = [Comment]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView = UITableView.init(frame:
            CGRect.init(
                x: 0,
                y: 0,
                width: self.view.frame.size.width,
                height: self.view.frame.size.height - 110))
        
        self.view.addSubview(self.tableView!)
        tableView!.register(CommentCell.self, forCellReuseIdentifier: "commentCell")
        self.tableView?.delegate = self
        // Do any additional setup after loading the view.
        
        self.commentsList.append(Comment.init(text: "Here is my comment", date: Date()))
        
        
        print(self.commentsList)
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

    //MARK: - UITableView Delegates
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.commentsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentsCell", for: indexPath) as! CommentCell
        
        return cell
    }
}
