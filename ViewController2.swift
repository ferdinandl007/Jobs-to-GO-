//
//  ViewController2.swift
//  Jobs to GO!
//
//  Created by Ferdinand Lösch on 09.03.18.
//  Copyright © 2018 Ferdinand Lösch. All rights reserved.
//

import UIKit



class ViewController2: UIViewController {
    var vov = CGFloat()
    @IBOutlet weak var image: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        vov = self.view.frame.origin.y
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController2.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController2.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        self.hideKeyboardWhenTappedAround()
        
        // Do any additional setup after loading the view.
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height - 50
            }
        }
        
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y = vov
            }
        }
    }
    

    @IBAction func clers(_ sender: Any) {
        jodt.text = ""
        loc.text = "-"
        date.text = "00"
        pNumber.text = "00"
        year.text = "000"
        
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var bake: UIButton!
    @IBOutlet weak var jodt: UITextField!
    @IBOutlet weak var loc: UITextField!
    @IBOutlet weak var date: UITextField!
    @IBOutlet weak var pNumber: UITextField!
    
    @IBOutlet weak var daneM: UITextField!
    @IBOutlet weak var year: UITextField!
    
    
    @IBAction func backe(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
     

    }
    
    @IBAction func addjob(_ sender: Any) {
        
        
        
        
        if date.text != nil && jodt.text != nil && loc.text != nil && pNumber.text != nil && year.text != nil && daneM.text != nil {
            
        
            DBProvider.Instance.svaeUser(data:  [(self.date.text! + "-" + self.daneM.text! + "-" + self.year.text!),self.jodt.text!,self.loc.text!,self.pNumber.text!] )
                  print("ss")
           
            
            
            
            print("dd")
        }else {
            print("no")
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
  

}

extension ViewController2 {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController2.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
}
}

