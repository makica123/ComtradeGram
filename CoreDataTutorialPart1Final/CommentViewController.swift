//
//  CommentViewController.swift
//  CoreDataTutorialPart1Final
//
//  Created by Marija Grujic on 12/4/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import UIKit

class CommentViewController: UIViewController {
    
    var photo:Photo?
    var tableView:UITableView?
    
    

    override func viewDidLoad() {
       
        
        super.viewDidLoad()
     self.tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        
       
        
        
        
        
        
        
        // Do any additional setup after loading the view.
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

}

