//
//  ViewController.swift
//  C4Sample
//
//  Created by 山口智生 on 2016/04/25.
//  Copyright © 2016年 ha1f. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var selectSampleTableView: UITableView!
    
    let titles = ["PieChart"]
    
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

extension ViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SelectSampleTableViewCell") as! SelectSampleTableViewCell
        cell.titleLabel.text = titles[indexPath.row]
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let controller: UIViewController
        if indexPath.row == 0 {
            controller = PieChartViewController()
        } else {
            controller = PieChartViewController()
        }
        controller.title = titles[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
}