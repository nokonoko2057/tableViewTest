//////
//////  ViewController.swift
//////  tebleViewTest
//////
//////  Created by yuki takei on 2015/12/07.
//////  Copyright © 2015年 yuki takei. All rights reserved.
//////
////

import UIKit

class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{
    
    
    @IBOutlet weak var myTableView: UITableView!
    let myItems: NSMutableArray = ["TEST1", "TEST2", "TEST3"]


    override func viewDidLoad() {
        super.viewDidLoad()
        
        // DataSourceの設定をする.
        myTableView.dataSource = self
        
        // Delegateを設定する.
        myTableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func editTapped(sender: AnyObject) {
        if editing {
            super.setEditing(false, animated: true)
            myTableView.setEditing(false, animated: true)
        } else {
            super.setEditing(true, animated: true)
            myTableView.setEditing(true, animated: true)
        }
    }

    @IBAction func addTapped(sender: AnyObject) {
        
        // myItemsに追加.
        myItems.addObject("タイトルNEW")
        
        // TableViewを再読み込み.
        myTableView.reloadData()
    }
        
        
    // セルの行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(myItems.count)
        return myItems.count
    }
    
    // セルの設定
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell:TableViewCell = tableView.dequeueReusableCellWithIdentifier("SampleCell", forIndexPath: indexPath) as! TableViewCell
        
        cell.cellLabel.text = "\(myItems[indexPath.row])"
        
//        // tag1を取得
//        var titleText = cell.viewWithTag(1) as! UILabel
//        titleText.text = "\(myItems[indexPath.row])"
        return cell
    }
    
    // セルを追加or削除しようとした場合
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        
        // 削除のとき.
        if editingStyle == UITableViewCellEditingStyle.Delete {
            // 指定されたセルのオブジェクトをmyItemsから削除する.
            myItems.removeObjectAtIndex(indexPath.row)
            
            // TableViewを再読み込み.
            tableView.reloadData()
        }
    }
    
    // セルの並び替えを有効にする
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        
    }



}



