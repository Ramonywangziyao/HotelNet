//
//  LoginController.swift
//  Project_HotelNet
//
//  Created by Ziyao Wang on 7/16/15.
//  Copyright (c) 2015 Ziyao Wang. All rights reserved.
//

import UIKit
import CoreData

class LoginController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var account: UITextField!
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        account.delegate = self;
        password.delegate = self;
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        if password.isFirstResponder() || account.isFirstResponder() {
            password.resignFirstResponder()
            account.resignFirstResponder()
        }
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        if textField == account{
            account.resignFirstResponder()
            password.becomeFirstResponder()
        }
        else if textField == password{
            password.resignFirstResponder()
        }
        return true
    }
    

    @IBAction func loginEvent(sender: AnyObject) {
        
        if password.text.isEmpty
        {
            password.placeholder = "请输入密码！"
        }
        if account.text.isEmpty
        {
            account.placeholder = "请输入账号！"
        }
        //登录验证
        if account.text.isEmpty == false && password.text.isEmpty == false
        {
            
            var appDel:AppDelegate=(UIApplication.sharedApplication().delegate as? AppDelegate)!
            var context = appDel.managedObjectContext
            var error:NSError?
   /*
            var fectchRequest = NSFetchRequest(entityName: "Customers")
  
            var zoename = self.account.text
            var predicate:NSPredicate = NSPredicate(format:"name contains %@",zoename )
            println("asdasdsa")
           
        
            // var fectchRuslt = context?.executeFetchRequest(fectchRequest, error: &error) as! [NSManagedObject]?
            */
            var fectchRequest = NSFetchRequest(entityName: "Customers")
            var fectchRuslt = context?.executeFetchRequest(fectchRequest, error: &error)
            println("asdasds")
            println( fectchRuslt?.count)
           
            self.performSegueWithIdentifier("loginAction", sender: self)
        }
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
