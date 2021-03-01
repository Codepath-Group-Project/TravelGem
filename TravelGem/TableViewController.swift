//
//  TableViewController.swift
//  TravelGem
//
//  Created by Peiwen Tan on 2/23/21.
//

import UIKit

class TableViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.poi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "POICell") as! POICell
        let POI = self.poi[indexPath.row]
        let name = POI["name"] as! String
        
//        let base_url = "https://maps.googleapis.com/maps/api/place/photo?key=AIzaSyDs_55Oj6cdQb4gX96P0UjvY3tBo0ANQqI&maxheight=314&maxwidth=414&photoreference="
//        let POI_photo = POI["photos"] as! [[String: Any]]
//        let poster_path = POI_photo[0]["photo_reference"]
       
        
        
        
        cell.POINameLabel.text = name
        
        return cell
    }
    

    
    @IBOutlet weak var tableView: UITableView!
    
    var placeId = [[String:Any]]()
    var geoCoordinates = [String:Any]()
    var poi = [[String:Any]]()
    var cityname : String = ""
 
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        let city = self.cityname
//        if city != nil{
//            let url = URL(string: "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?key=AIzaSyDs_55Oj6cdQb4gX96P0UjvY3tBo0ANQqI&inputtype=textquery&input= \(city!)")!
//
//        }else{
//           print("error")
//            let url = URL(string: "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?key=AIzaSyDs_55Oj6cdQb4gX96P0UjvY3tBo0ANQqI&inputtype=textquery&input= Irvine")!
//        }
        print(self.cityname)
        guard let url = URL(string: "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?key=AIzaSyDs_55Oj6cdQb4gX96P0UjvY3tBo0ANQqI&inputtype=textquery&input=\(city)") else {
                print("done")
                return }
        print( url)
        
        
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
           // This will run when the network request returns
           if let error = error {
              print(error.localizedDescription)
           } else if let data = data {
              let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
            self.placeId = dataDictionary["candidates"] as! [[String:Any]]
            let place_ID = self.placeId[0]["place_id"] as! String
            
            print(place_ID)
            print(self.placeId)
            
            let url1 = URL(string: "https://maps.googleapis.com/maps/api/place/details/json?key=AIzaSyDs_55Oj6cdQb4gX96P0UjvY3tBo0ANQqI&place_id=\(place_ID)")!
            let request1 = URLRequest(url: url1, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
            let session1 = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
            let task1 = session1.dataTask(with: request1) { (data, response, error) in
               // This will run when the network request returns
               if let error = error {
                  print(error.localizedDescription)
               } else if let data = data {
                  let dataDictionary1 = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                self.geoCoordinates = dataDictionary1["result"] as![String:Any]
                let geo = self.geoCoordinates["geometry"] as! [String:Any]
                let geo1 = geo["location"] as! [String:Any]
                let lat = geo1["lat"] as! Double
                let lng = geo1["lng"] as! Double
                print(lat)
                print(lng)
                
                let url2 = URL(string: "https://maps.googleapis.com/maps/api/place/nearbysearch/json?key=AIzaSyDs_55Oj6cdQb4gX96P0UjvY3tBo0ANQqI&location=\(lat),\(lng)&radius=500000&type=tourist_attraction")!
                let request2 = URLRequest(url: url2, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
                let session2 = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
                let task2 = session2.dataTask(with: request2) { (data, response, error) in
                   // This will run when the network request returns
                   if let error = error {
                      print(error.localizedDescription)
                   } else if let data = data {
                      let dataDictionary2 = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                    self.poi = dataDictionary2["results"] as! [[String:Any]]
                    print(self.poi)
                    
                    
                    
                self.tableView.reloadData()
               
                // Do any additional setup after loading the view.
                }
            }
            task2.resume()
                
                
      
           
            // Do any additional setup after loading the view.
            }
        }
        task1.resume()

        // Do any additional setup after loading the view.
        }
    }
    task.resume()
    
   

}
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
