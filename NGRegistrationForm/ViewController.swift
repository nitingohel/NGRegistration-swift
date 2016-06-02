//
//  ViewController.swift
//  NGRegistrationForm
//
//  Created by Nitin Gohel on 01/06/16.
//  Copyright © 2016 Nitin Gohel. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {

    
    @IBOutlet var step1: UIView!
    @IBOutlet var step2: UIView!
    @IBOutlet var step3: UIView!
    @IBOutlet var step4: UIView!
    
    //MARK: TOP 4 BUTTON
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    
    
    
    //MARK: Fist View All variable
    
    @IBOutlet weak var txtFirstField: UITextField!
    @IBOutlet weak var btnFirstNext: UIButton!
    //MARK: second View All variable
    
    @IBOutlet weak var txtSecondField: UITextField!
    @IBOutlet weak var btnSecondNext: UIButton!
    //MARK: third View All variable
    
    @IBOutlet weak var txtThirdField: UITextField!
    @IBOutlet weak var btnNextThird: UIButton!
    //MARK: four View All variable
    
    @IBOutlet weak var txtFourthField: UITextField!
    @IBOutlet weak var btnFountFinish: UIButton!
    
    var nibViews = [AnyObject]()
    
  var scrollView = UIScrollView()
    var pageControl = UIPageControl()
  

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nibViews = NSBundle.mainBundle().loadNibNamed("PagingFlow", owner: self, options: nil)
        
        let bounds = UIScreen.mainScreen().bounds
        let width = bounds.size.width
        let height = bounds.size.height
        
        self.btn1 = self.EnableButton(self.btn1)
        self.btn2 = self.DesableButton(self.btn2)
        self.btn3 = self.DesableButton(self.btn3)
        self.btn4 = self.DesableButton(self.btn4)
        
        
        self.btn1.layer.cornerRadius = self.btn1.frame.height/2
        self.btn2.layer.cornerRadius = self.btn2.frame.height/2
        self.btn3.layer.cornerRadius = self.btn3.frame.height/2
        self.btn4.layer.cornerRadius = self.btn4.frame.height/2
        
        
        self.btnFirstNext = self.DesableButton(self.btnFirstNext)
        self.btnSecondNext = self.DesableButton(self.btnSecondNext)
        self.btnNextThird = self.DesableButton(self.btnNextThird)
        self.btnFountFinish = self.DesableButton(self.btnFountFinish)
        
        
        
        self.scrollView = UIScrollView(frame: CGRectMake(0, 100, width, height-100))
        self.scrollView.scrollEnabled = false
        var frame: CGRect = CGRectMake(0, 0, 0, 0)
        self.pageControl =  UIPageControl(frame: CGRectMake(50, 300, 200, 50))
        
        

        scrollView.delegate = self
        self.view.addSubview(scrollView)
        for index in 0..<nibViews.count {
            
            frame.origin.x = self.scrollView.frame.size.width * CGFloat(index)
            frame.size = self.scrollView.frame.size
            self.scrollView.pagingEnabled = true
            
            
            
            let subview = nibViews[index] as! UIView
                subview.frame = frame
                self.scrollView .addSubview(subview)
           
            
            
           
        }
        
        self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * 4, self.scrollView.frame.size.height)
    

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func configurePageControl() {
        // The total number of pages that are available is based on how many available colors we have.
        
       // self.pageControl.numberOfPages = colors.count
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = UIColor.redColor()
        self.pageControl.pageIndicatorTintColor = UIColor.blackColor()
        self.pageControl.currentPageIndicatorTintColor = UIColor.greenColor()
        self.view.addSubview(pageControl)
        
    }
    
    // MARK : TO CHANGE WHILE CLICKING ON PAGE CONTROL
    func changePage(sender: AnyObject) -> () {
        let x = CGFloat(pageControl.currentPage) * scrollView.frame.size.width
        scrollView.setContentOffset(CGPointMake(x, 0), animated: true)
    }
    
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
        
        
    
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    //MARK : 4 BUTTON ACTION
    
    
    @IBAction func Action_1(sender: UIButton) {
        
        let x = CGFloat(0) * scrollView.frame.size.width
        scrollView.setContentOffset(CGPointMake(x, 0), animated: true)
    }
    @IBAction func Action_2(sender: UIButton) {
        
        let x = CGFloat(1) * scrollView.frame.size.width
        scrollView.setContentOffset(CGPointMake(x, 0), animated: true)
    }
    @IBAction func Action_3(sender: UIButton) {
        
        let x = CGFloat(2) * scrollView.frame.size.width
        scrollView.setContentOffset(CGPointMake(x, 0), animated: true)
    }
    @IBAction func Action_4(sender: UIButton) {
        let x = CGFloat(3) * scrollView.frame.size.width
        scrollView.setContentOffset(CGPointMake(x, 0), animated: true)
    }
    

    
    
    
    //MARK: 4th IBAction
    
    @IBAction func ActionFinish(sender: UIButton) {
        
       
    }
    
    @IBAction func Action_Next_third(sender: UIButton) {
        
        
        self.btn4 = self.EnableButton(self.btn4)
        let x = CGFloat(3) * scrollView.frame.size.width
        scrollView.setContentOffset(CGPointMake(x, 0), animated: true)
    }

    @IBAction func action_next_second(sender: UIButton) {
        
         self.btn3 = self.EnableButton(self.btn3)
        let x = CGFloat(2) * scrollView.frame.size.width
        scrollView.setContentOffset(CGPointMake(x, 0), animated: true)    }

    @IBAction func btn_next_first(sender: UIButton) {
        
        
        self.btn2 = self.EnableButton(self.btn2)
       
        

        
        
        let x = CGFloat(1) * scrollView.frame.size.width
        scrollView.setContentOffset(CGPointMake(x, 0), animated: true)
    }
    
    
    
    //MARK: Textfiled deleget
    
//    func textFieldDidBeginEditing(textField: UITextField!) {
//        
//        if textField .isEqual(txtFirstField)
//        {
//        
//            if textField.text?.characters.count > 0
//            {
//                self.btnFirstNext = EnableButton(self.btnFirstNext)
//                
//            }
//            else
//            {
//                self.btnFirstNext = DesableButton(self.btnFirstNext)
//                
//            }
//        
//        }
//        
//    }
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        var updatedTextString : NSString = textField.text! as NSString
        updatedTextString = updatedTextString.stringByReplacingCharactersInRange(range, withString: string)
       
        
        
        if textField .isEqual(txtFirstField)
        {
            
            if updatedTextString.length>0 {
                 self.btnFirstNext = EnableButton(self.btnFirstNext)
                
                
            }
            else
            {
           self.btnFirstNext = DesableButton(self.btnFirstNext)
            }
            
        }
        if textField .isEqual(txtSecondField)
        {
            
            if updatedTextString.length>0 {
                self.btnSecondNext = EnableButton(self.btnSecondNext)
                
            }
            else
            {
                self.btnSecondNext = DesableButton(self.btnSecondNext)
            }
            
        }
        if textField .isEqual(txtThirdField)
        {
            
            if updatedTextString.length>0 {
                self.btnNextThird = EnableButton(self.btnNextThird)
                
            }
            else
            {
                self.btnNextThird = DesableButton(self.btnNextThird)
            }
            
        }
        if textField .isEqual(txtFourthField)
        {
            
            if updatedTextString.length>0 {
                self.btnFountFinish = EnableButton(self.btnFountFinish)
                
            }
            else
            {
                self.btnFountFinish = DesableButton(self.btnFountFinish)
            }
            
        }


        
       return true
    }
    

    
    func DesableButton(button: UIButton) -> UIButton {
        button.enabled = false;
        button.alpha = 0.5
        
        return button
    }
    
    
    func EnableButton(button: UIButton) -> UIButton {
        button.enabled = true;
        button.alpha = 1
        
        return button
    }
    
}

