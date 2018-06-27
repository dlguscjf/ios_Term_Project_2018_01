//
//  DetailViewController.swift
//  UiTableViewController Test 02
//
//  Created by D7703_04 on 2018. 5. 28..
//  Copyright © 2018년 lse. All rights reserved.
//

import UIKit
import MapKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MKMapViewDelegate {

    @IBOutlet weak var detailTableView: UITableView!
    @IBOutlet weak var cellImageView: UIImageView!
    
    var cellImage: String = ""
    var name: String = ""
    var local1: String = ""
    var tel1: String = ""
    var menu: String = ""
    var type: String = ""
    var cellimage = [String]()
    var count = 0
    var myTimer = Timer()
    var ck = true
    
  
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        // delegate connection
        detailTableView.delegate = self
        detailTableView.dataSource = self
         cellImageView.image = UIImage(named: cellimage[0])

        self.title = name
      
        
        

    }

    
    
    @IBAction func ok(_ sender: Any) {
        if ck{
             ck = false
            myTimer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true, block: {(myTimer) in self.updateTime()})
           
        }
        else{
            myTimer.invalidate();
            ck = true
        }
    

     }
    func updateTime(){
        if count < cellimage.count{
            print(cellimage[count])
            cellImageView.image = UIImage(named: cellimage[count])
            count = count + 1
        
        }
        if count == cellimage.count{
            count = 0
        }
    }
    
    func count(i : Int) {
        
            cellImageView.image = UIImage(named: cellimage[i])
        
        }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath)
            cell.textLabel?.text = "주소 : " + local1
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath)
            cell.textLabel?.text = "전화번호 : " + tel1
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath)
            cell.textLabel?.text = "전체 메뉴"
            return cell
        default :
            let cell = tableView.dequeueReusableCell(withIdentifier: "mapCell", for: indexPath) as! MapTableViewCell
            cell.configure(location: local1)
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 전화걸기 alert
        if(indexPath.row == 1){
        let optionMenu = UIAlertController(title : "통화 하기 : " + name, message: tel1, preferredStyle: .alert)
        let call = UIAlertController(title : "통화 중 " + name, message: tel1, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler:nil)
        let callAction = UIAlertAction(title : "통화를 하시겠습니까.", style: .default){
            (action: UIAlertAction) -> Void in
            call.addAction(cancelAction)
            self.present(call, animated: true, completion: nil)
            }
        optionMenu.addAction(callAction)
        optionMenu.addAction(cancelAction)
            present(optionMenu, animated: true, completion: nil)}
        else if(indexPath.row == 2){
            let optionMenu = UIAlertController(title : "전체 메뉴", message: menu, preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "확인", style: .cancel, handler:nil)
        
            optionMenu.addAction(cancelAction)
            present(optionMenu, animated: true, completion: nil)}
    }

    //
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailMapView" {
            if detailTableView.indexPathForSelectedRow != nil {
                let destinationController = segue.destination as! MapViewController
                destinationController.location = local1
                destinationController.name = name
                destinationController.tel = tel1
            }
        }
        
    }

}

