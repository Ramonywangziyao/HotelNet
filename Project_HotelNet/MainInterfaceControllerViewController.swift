//
//  MainInterfaceControllerViewController.swift
//  Project_HotelNet
//
//  Created by Ziyao Wang on 7/16/15.
//  Copyright (c) 2015 Ziyao Wang. All rights reserved.
//

import UIKit

class MainInterfaceControllerViewController: UITabBarController{

    override func viewDidLoad() {
        super.viewDidLoad()
        var tabController:UITabBarController = self
        
        var tabBar : UITabBar?
        let item1 = self.tabBar.items![0] as! UITabBarItem
        let item2 = self.tabBar.items![1] as! UITabBarItem
        let item3 = self.tabBar.items![2] as!UITabBarItem
        
        item1.title = "微旅圈"
        item2.title = "发布站"
        item3.title = "个人中心"
        
        item1.image = UIImage(named:"social")
        item2.image = UIImage(named:"fabuNew")
        item2.selectedImage = UIImage(named:"fabuNew")
        item3.image = UIImage(named:"personlCenter")
        UITabBar.appearance().tintColor = UIColor.orangeColor();
        
        // Do any additional setup after loading the view.
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
