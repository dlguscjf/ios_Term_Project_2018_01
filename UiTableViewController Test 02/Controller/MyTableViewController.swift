import UIKit

class MyTableViewController: UITableViewController {
    
 
    // 데이터 클래스 객체 생성
    var foodStores:[FoodStore] = [
        FoodStore(name: "늘해랑", image: "01", address: "부산광역시 부산진구 양정1동 350-1", tel: "051-863-6997", menu: "수육백반 : 8500원 \n 돼지국밥 : 6000원 \n 순대국밥 : 6500원 \n 내장국밥 : 6500원", type: "돼지국밥집"),
        FoodStore(name: "번개반점", image: "02", address: "부산광역시 부산진구 양정동 418-282", tel: "051-852-9969", menu: "짜장면 : 4500원 \n, 짬뽕 : 5500원 \n, 짬짜면 : 6000원 \n, 탕수육 : 17000원 \n, 탕짜면 : 13000원 \n, 군만두 : 4000원 \n, 양장피 : 25000원", type: "중화요리"),
        FoodStore(name: "아딸", image: "03", address: "부산광역시 부산진구 양정동 393-18", tel: "051-852-9969", menu: "떡볶이 : 2500원 \n, 허브탕수육 : 5000원 \n, 찹쌀순대 : 3000원 \n, 바베큐닭꼬치 : 1500원 \n , 허브튀김 : 2500원 \n", type: "분식점"),
        FoodStore(name: "왕짜장", image: "04", address: "부산광역시 부산진구 양정1동 356-22", tel: "051-863-6997", menu: "짜장면 : 3000원 \n, 짬뽕 : 4000원 \n, 짜장밥 : 4000원 \n, 탕수육 : 9000원 \n, 쟁반짜장 : 11000원 \n, 군만두 : 3000원 \n, 양장피 : 22000원 \n", type: "중화요리"),
        FoodStore(name: "토마토 도시락", image: "05", address: "부산광역시 부산진구 양정1동 산19-8", tel: "051-863-6997", menu: "데리와퍼 : 3700원 \n, 데리와퍼참치 : 3700원 \n, 치킨마요 : 2800원 \n, 냉모밀돈까스 : 4800원 \n, 간장치킨도시락 : 4000원 \n", type: "도시락"),
        FoodStore(name: "홍콩반점", image: "06", address: "부산광역시 부산진구 양정동 353-38", tel: "051-863-6997", menu: "짬뽕 : 4500원 \n 짜장면 : 4000원 \n 짬뽕밥 : 5000원 \n 쟁반짜장 : 11000원 \n 탕수육 : 9500원 \n 군만두 : 4000원", type: "중화요리"),
        FoodStore(name: "롯데리아", image: "07", address: "부산광역시 부산진구 양정1동 394-16", tel: "051-861-3900", menu: "데리버거세트 : 4700원 \n 새우버거 세트 : 5600원 \n 불고기버거 세트 : 5600원 \n 핫크리스피버거 세트 : 6500원 \n 모짜렐라 인 더 버거-더블 세트 : 7200원 \n", type: "패스트푸드")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.title = "DIT 배달통"
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //return foodStoreNames.count
        return foodStores.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RE", for: indexPath)
            as! FoodStoreTableViewCell
 
        
        cell.foodStoreCellName.text = foodStores[indexPath.row].name
        cell.foodStoreCellImage.image = UIImage(named: foodStores[indexPath.row].image)
        cell.foodStoreCellAddress.text = foodStores[indexPath.row].address
        cell.foodStoreCellTel.text = foodStores[indexPath.row].tel
        
        return cell
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 
        if segue.identifier == "showDetail" {
            if let indexPath =  tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! DetailViewController
                
                destinationController.name = foodStores[indexPath.row].name
                // 이미지 넘기기
                destinationController.cellImage = foodStores[indexPath.row].image
                destinationController.local1 = foodStores[indexPath.row].address
                destinationController.tel1 = foodStores[indexPath.row].tel
                destinationController.menu = foodStores[indexPath.row].menu
                destinationController.type = foodStores[indexPath.row].type
                
            }
        } else if segue.identifier == "totalMapView" {
                let destinationController = segue.destination as! TotalMapViewController
                    destinationController.totalFoodStores = foodStores

        }
    }
}
