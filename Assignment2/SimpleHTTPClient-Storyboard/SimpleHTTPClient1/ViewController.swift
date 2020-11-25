//
//  ViewController.swift
//  SimpleHTTPClient1
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    var cService : ClaimService!
    @IBOutlet weak var addBtnOutlet: UIButton!
    @IBOutlet weak var statTxt: UITextField!
    @IBOutlet weak var dateTxt: UITextField!
    @IBOutlet weak var claimTxt: UITextField!
    @IBAction func AddBtnAction(_ sender: Any) {
        
    cService = ClaimService()
        
    if claimTxt.text?.count != 0 && dateTxt.text?.count != 0{
        let cObj = Claim(this_title: claimTxt.text!, this_date: dateTxt.text!)
        cService.addClaim(pObj: cObj, completion: {result in
           DispatchQueue.main.async {
               self.claimTxt.text = ""
               self.dateTxt.text = ""
               self.statTxt.text = result
            }
        })
       }
       else {
           statTxt.text = "Title and Date cannot be empty"
       }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

