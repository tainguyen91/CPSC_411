//
//  ViewController.swift
//  SimpleHTTPClient1
//

import UIKit

class ViewController: UIViewController {
    var cService : ClaimService!
    var titleLbl: UILabel!
    var claimLbl: UILabel!
    var dateLbl: UILabel!
    var claimTxt: UITextField!
    var dateTxt: UITextField!
    var addBtn : UIButton!
    var statLbl: UILabel!
    var statTxt: UITextField!
    
    @objc func add(sender: UIButton) {
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
        view = UIView()
        view.backgroundColor = .white
        
        titleLbl = UILabel()
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        titleLbl.textAlignment = .center
        titleLbl.text = "Please Enter Claim Information"
        titleLbl.font = UIFont(name: "Georgia-Bold", size: 16)
        view.addSubview(titleLbl)
        
        claimLbl = UILabel()
        claimLbl.translatesAutoresizingMaskIntoConstraints = false
        claimLbl.textAlignment = .left
        claimLbl.text = "Claim Title"
        view.addSubview(claimLbl)
        
        claimTxt = UITextField()
        claimTxt.translatesAutoresizingMaskIntoConstraints = false
        claimTxt.placeholder = "Enter Claim Title"
        view.addSubview(claimTxt)
        
        dateLbl = UILabel()
        dateLbl.translatesAutoresizingMaskIntoConstraints = false
        dateLbl.textAlignment = .left
        dateLbl.text = "Date"
        view.addSubview(dateLbl)
       
        dateTxt = UITextField()
        dateTxt.translatesAutoresizingMaskIntoConstraints = false
        dateTxt.placeholder = "MM-DD-YYYY"
        view.addSubview(dateTxt)
        
        addBtn = UIButton()
        addBtn.translatesAutoresizingMaskIntoConstraints = false
        addBtn.setTitle("Add", for: .normal)
        addBtn.setTitleColor(.black, for: .normal)
        view.addSubview(addBtn)
        
        statLbl = UILabel()
        statLbl.translatesAutoresizingMaskIntoConstraints = false
        statLbl.textAlignment = .left
        statLbl.text = "Status:"
        view.addSubview(statLbl)
        
        statTxt = UITextField()
        statTxt.translatesAutoresizingMaskIntoConstraints = false
        statTxt.placeholder = "<Status Message>"
        statTxt.sizeToFit()
        view.addSubview(statTxt)
        
        NSLayoutConstraint.activate([
            titleLbl.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            titleLbl.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            titleLbl.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            claimLbl.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 15),
            claimLbl.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            claimLbl.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.3),
            
            claimTxt.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 15),
            claimTxt.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            claimTxt.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.7),
            
            dateLbl.topAnchor.constraint(equalTo: claimLbl.bottomAnchor, constant: 10),
            dateLbl.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            dateLbl.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.3),
           
            dateTxt.topAnchor.constraint(equalTo: claimTxt.bottomAnchor, constant: 10),
            dateTxt.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            dateTxt.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.7),
            
            addBtn.topAnchor.constraint(equalTo: dateLbl.bottomAnchor, constant: 15),
            addBtn.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            statLbl.topAnchor.constraint(equalTo: addBtn.bottomAnchor, constant: 15),
            statLbl.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            statLbl.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.3),
            
            statTxt.topAnchor.constraint(equalTo: addBtn.bottomAnchor, constant: 15),
            statTxt.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            statTxt.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.7)
       ])
        
          addBtn.addTarget(self, action: #selector(add), for: .touchUpInside)
    }


}

