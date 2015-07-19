//
//  SignUpController.swift
//  Project_HotelNet
//
//  Created by Ziyao Wang on 7/16/15.
//  Copyright (c) 2015 Ziyao Wang. All rights reserved.
//

import UIKit
import CoreData
class SignUpController: UIViewController,UITextFieldDelegate  {

    @IBOutlet weak var signUpAccount: UITextField!
    @IBOutlet weak var signUpPass: UITextField!
    
    @IBOutlet weak var confirmPass: UITextField!
    
    @IBOutlet weak var testCode: UITextField!
    
    var appDel:AppDelegate?
    var context:NSManagedObjectContext?


    override func viewDidLoad() {
        super.viewDidLoad()
        signUpAccount.delegate = self;
        signUpPass.delegate = self;
        confirmPass.delegate = self;
        testCode.delegate = self;
        self.appDel = UIApplication.sharedApplication().delegate as? AppDelegate
        
        
        
        self.context = appDel!.managedObjectContext
        
        var entity = NSEntityDescription.entityForName("Customers", inManagedObjectContext: context!)
        
        var person = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: context)
        

    
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent)
    {
         //above keyboard manipulate
        if signUpPass.isFirstResponder() || signUpAccount.isFirstResponder() || confirmPass.isFirstResponder() || testCode.isFirstResponder()
        {
            signUpPass.resignFirstResponder()
            signUpAccount.resignFirstResponder()
            confirmPass.resignFirstResponder()
            testCode.resignFirstResponder()
        }
        
        

        
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        
        if textField == signUpAccount{
            signUpAccount.resignFirstResponder()
            signUpPass.becomeFirstResponder()
        }
        else if textField == signUpPass{
            signUpPass.resignFirstResponder()
            confirmPass.becomeFirstResponder()
        }else if textField == confirmPass{
            confirmPass.resignFirstResponder()
            testCode.becomeFirstResponder()
        }
        return true
    }
    
    @IBAction func signUpButtonEvent(sender: AnyObject) {
        
        if signUpAccount.text.isEmpty
        {
            signUpAccount.placeholder = "请输入手机号！"
        }
        if signUpPass.text.isEmpty
        {
            signUpPass.placeholder = "请输入密码！"
        }
        if confirmPass.text.isEmpty
        {
            confirmPass.placeholder = "请确认密码！"
        }
        if testCode.text.isEmpty
        {
            testCode.placeholder = "请输入验证码！"

        }
        if !confirmPass.text.isEmpty
        {
            
            var isSame = signUpPass.text as NSString==confirmPass.text as NSString
            println(isSame)
         
            if isSame==false
            {
                confirmPass.text = ""
                confirmPass.placeholder = "与您的输入不一致！"
            }
    
        }
        
        
        
        //注册成功
        if signUpAccount.text.isEmpty == false && signUpPass.text.isEmpty == false && confirmPass.text.isEmpty == false && testCode.text.isEmpty == false
        {
            var newperson:Customers = NSEntityDescription.insertNewObjectForEntityForName("Customers", inManagedObjectContext: context!) as! Customers
            var error:NSError?
            newperson.account = self.signUpAccount.text
            newperson.password = self.signUpPass.text
       
            
            if (context?.save(&error) == nil){
                
                println("could not save \(error)")
            }else{
                context?.save(&error)
                println("save is ok  \(context)")
            }
            self.performSegueWithIdentifier("signUpSucceed", sender: self)
        }
        
        
        
    }
    func handleTimer(obj:AnyObject,numb:Int)
    {

          //  var numbStr = toString(numb)
         //   obj.setTitle("已发送"+" "+numbStr, forState:UIControlState.Normal)
            
            
       //     println(numb)
        
    }
    
    
    @IBAction func sendCode(sender: AnyObject) {
       
      //for var index = 3;index>=0;
    //  {
 
      //      handleTimer(sender,numb: index)
              NSThread.sleepForTimeInterval(3)
              sender.setTitle("再次发送验证码",forState:UIControlState.Normal)
        
       //     index-=1
       // }

        //sender.setTitle("已发送",forState:UIControlState.Normal)
        //sender.disa
       
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
