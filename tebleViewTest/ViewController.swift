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





//import UIKit
//
//class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{
//
//    let myItems: NSMutableArray = ["TEST1", "TEST2", "TEST3"]
//
//    @IBOutlet var TableView: UITableView!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//        //tableView.separatorColor = UIColor.blueColor()
//
//        
//        TableView.delegate = self
//        TableView.dataSource = self
//        
//        // Cellの登録.
//        TableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
//
//        
//        // 編集中のセル選択を許可.
//        TableView.allowsSelectionDuringEditing = true
//
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//    // セルに表示するテキスト
//    let texts = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
//    
//    // セルの行数
//
////    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
////        return texts.count
////    }
////    
////    // セルの内容を変更
////    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
////        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
////        
////        cell.textLabel?.text = texts[indexPath.row]
////        return cell
////    }
//
////
////}
//
//
//
//// ViewCOntroller.swift
//// UIKit051
////
//
////import UIKit
////
////class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//    
////    let myItems: NSMutableArray = ["TEST1", "TEST2", "TEST3"]
////    var myTableView: UITableView!
//    
////    override func viewDidLoad() {
////        super.viewDidLoad()
////        
//////        // ナビゲーションバーに表示するタイトル.
////        self.title = "TableView Test"
////        
////        // ナビゲーションバーを取得.
////        self.navigationController?.navigationBar
////        
////        // ナビゲーションバーを表示.
////        self.navigationController?.navigationBarHidden = false
////        
////        // ナビゲーションバーの右側に編集ボタンを追加.
////        self.navigationItem.rightBarButtonItem = self.editButtonItem()
////        
////        // Status Barの高さを取得.
////        let barHeight: CGFloat = UIApplication.sharedApplication().statusBarFrame.size.height
////        
////        // Viewの高さと幅を取得.
////        let displayWidth: CGFloat = self.view.frame.width
////        let displayHeight: CGFloat = self.view.frame.height
////        
////        // TableViewの生成( status barの高さ分ずらして表示 ).
////        myTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
////        
////        // Cellの登録.
////        myTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
////        
////        // DataSourceの設定.
////        myTableView.dataSource = self
////        
////        // Delegateを設定.
////        myTableView.delegate = self
////        
////        // 罫線を青色に設定.
////        myTableView.separatorColor = UIColor.blueColor()
////        
////        // 編集中のセル選択を許可.
////        myTableView.allowsSelectionDuringEditing = true
//
////        // TableViewをViewに追加する.
////        self.view.addSubview(myTableView)
////    }
//    /*
//    Cellが選択された際に呼び出される.
//    */
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        
//        // 選択中のセルが何番目か.
//        print("Num: \(indexPath.row)")
//        
//        // 選択中のセルのvalue.
//        print("Value: \(myItems[indexPath.row])")
//        
//        // 選択中のセルを編集できるか.
//        print("Edeintg: \(tableView.editing)")
//    }
//
//    
//    /*
//    Cellの総数を返す
//    (実装必須)
//    */
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return myItems.count
//        //return texts.count
//    }
//    
//    /*
//    Cellに値を設定する
//    (実装必須)
//    */
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        
//        var cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
//        cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath)
//        
//        // Cellに値を設定.
//        cell.textLabel?.text = "\(myItems[indexPath.row])"
//        
//        return cell
//        
//        
//
//    }
//    
//    /*
//    編集ボタンが押された際に呼び出される
//    */
//    override func setEditing(editing: Bool, animated: Bool) {
//        super.setEditing(editing, animated: animated)
//        
//        // TableViewを編集可能にする
//        TableView.setEditing(editing, animated: true)
//        
//        // 編集中のときのみaddButtonをナビゲーションバーの左に表示する
//        if editing {
//            print("編集中")
//            let addButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "addCell:")
//            self.navigationItem.setLeftBarButtonItem(addButton, animated: true)
//        } else {
//            print("通常モード")
//            self.navigationItem.setLeftBarButtonItem(nil, animated: true)
//        }
//    }
////
////    /*
////    addButtonが押された際呼び出される
////    */
////    func addCell(sender: AnyObject) {
////       print("追加")
////        
////        // myItemsに追加.
////        myItems.addObject("add Cell")
////        
////        // TableViewを再読み込み.
////        TableView.reloadData()
////    }
////    
////    /*
////    Cellを挿入または削除しようとした際に呼び出される
////    */
////    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
////        
////        // 削除のとき.
////        if editingStyle == UITableViewCellEditingStyle.Delete {
////            print("削除")
////            
////            // 指定されたセルのオブジェクトをmyItemsから削除する.
////            myItems.removeObjectAtIndex(indexPath.row)
////            
////            // TableViewを再読み込み.
////            TableView.reloadData()
////        }
////    }
//    
//
//}
