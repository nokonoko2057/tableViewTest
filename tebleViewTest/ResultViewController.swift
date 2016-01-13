//
//  ResultViewController.swift
//  tebleViewTest
//
//  Created by yuki takei on 2016/01/12.
//  Copyright © 2016年 yuki takei. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var mainImageView: UIImageView!
    var getImage:UIImage!
    var getText:String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = getText
        mainImageView.image = getImage
        // Do any additional setup after loading the view.
        
        //nanna
        
        
        
        label.textColor = UIColor.blueColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
