//
//  ViewController.swift
//  C4Sample
//
//  Created by 山口智生 on 2016/04/25.
//  Copyright © 2016年 ha1f. All rights reserved.
//

import UIKit

class SelectSampleViewController: UIViewController {
    
    @IBOutlet weak var selectSampleTableView: UITableView!
    
    let samples = Setting.samples
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        title = "C4 Sample"
        
        selectSampleTableView.delegate = self
        selectSampleTableView.dataSource = self
        selectSampleTableView.tableFooterView = UIView()
        selectSampleTableView.setContentOffset(CGPoint.zero, animated: false)
        selectSampleTableView.separatorColor = UIColor.lightGrayColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension SelectSampleViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return samples.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SelectSampleTableViewCell") as! SelectSampleTableViewCell
        cell.titleLabel.text = samples[indexPath.row].title
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
}

extension SelectSampleViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let controller = samples[indexPath.row].type.init()

        controller.title = samples[indexPath.row].title
        
        navigationController?.pushViewController(controller, animated: true)
    }
}
