//
//  RequestsController.swift
//  Echo
//
//  Created by Hansa Srinivasan on 4/6/15.
//  Copyright (c) 2015 Quartet. All rights reserved.
//

import UIKit

class RequestsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var personPic: UIImageView!
    
    @IBOutlet weak var personName: UILabel!
    
    @IBOutlet weak var playPauseButton: UIButton!
    
    @IBOutlet weak var songName: UILabel!
    
    @IBOutlet weak var acceptButton: UIButton!
    
    @IBOutlet weak var declineButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}

class RequestsController: ViewControllerWNav, UITableViewDataSource, UITableViewDelegate {
    var userList: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        userList = appDelegate.user.messenger.getPeopleRequested()
        var songRequests: [User: Message] = appDelegate.user.messenger.getRequests()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        println("RETURNING # of CELLS")
        return 5//userList.count
    }
 
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        println("MAKING CELLS")
        //let cell = tableView.dequeueReusableCellWithIdentifier("RequestsTableViewCell", forIndexPath: indexPath) as RequestsTableViewCell
        let cell = tableView.dequeueReusableCellWithIdentifier("RequestsTableViewCell") as RequestsTableViewCell
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let url = appDelegate.user.picURL as NSURL!
        if (url != "") {
            let dataForPic = NSData(contentsOfURL: url!)
            var image = UIImage(data: dataForPic!)
            if (image != nil) {
              cell.personPic.image = image!
            }
        }
        cell.personName.text = appDelegate.user.displayName
        
        
        return cell
    }
}