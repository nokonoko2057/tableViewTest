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

    var selectedText:String!
    var selectedImage:UIImage!
    let imgArray: NSArray = ["1.jpg","2.jpg","3.jpg","4.jpg","5.jpg","6.jpg","7.jpg","8.jpg"]
    

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

    //編集ボタンをタップされたとき
    @IBAction func editTapped(sender: AnyObject) {
        if editing {
            super.setEditing(false, animated: true)
            myTableView.setEditing(false, animated: true)
        } else {
            super.setEditing(true, animated: true)
            myTableView.setEditing(true, animated: true)
        }
    }
    //セル追加ボタンがタップされたとき
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
        cell.cellImageView.image = UIImage(named:"\(imgArray[indexPath.row])")
        
//        // tag1を取得
//        var titleText = cell.viewWithTag(1) as! UILabel
//        titleText.text = "\(myItems[indexPath.row])"
        return cell
    }
    
    //タップされたセル感知：遷移への準備
    func tableView(table: UITableView, didSelectRowAtIndexPath indexPath:NSIndexPath) {
        // [indexPath.row] から画像名を探し、UImage を設定
        selectedImage = UIImage(named:"\(imgArray[indexPath.row])")
        selectedText = "\(myItems[indexPath.row])"
        
        if selectedImage != nil {
            // resultViewController へ遷移するために Segue を呼び出す
            performSegueWithIdentifier("toResultVC",sender: nil)
        }
        
    }
    
    // Segue 準備
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "toResultVC") {
            let resultVC: ResultViewController = segue.destinationViewController  as! ResultViewController
            // SubViewController のselectedImgに選択された画像を設定する
            resultVC.getImage = selectedImage
            resultVC.getText = selectedText
        }
        
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



