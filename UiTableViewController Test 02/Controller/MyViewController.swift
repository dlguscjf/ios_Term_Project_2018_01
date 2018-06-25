//
//  MyViewController.swift
//  UiTableViewController Test 02
//
//  Created by D7703_16 on 2018. 6. 25..
//  Copyright © 2018년 lse. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     
    }
    
    @IBAction func go(_ sender: Any) {
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "main") else {
            return
        }
        
        self.navigationController?.pushViewController(uvc, animated: true)


        
    }
    
   

}
