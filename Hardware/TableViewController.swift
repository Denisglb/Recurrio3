//
//  TableViewController.swift
//  Hardware
//
//  Created by Denis Golub on 10/10/2017.
//  Copyright © 2017 Hardware. All rights reserved.
//

import UIKit

class Product {
    let name, productDesc: String
    let initialWeight: Float
    var currentWeight: Float
    init(initialWeight: Float, name: String, productDesc: String) {
        self.initialWeight = initialWeight
        self.name = name
        self.currentWeight = initialWeight
        self.productDesc = productDesc
    }
    
    func updateWeight(weight: Float) {
        self.currentWeight = weight
    }
    
}

var productDescriptions = ["Mayonnaise is Will's Favourite", "Nick loves milk", "Denis can never be sober as the hangover will kill him", "Alessio loves a bit of wine and pizza... dare you to find a more stereotypical Italian" ]

let product1 = Product(initialWeight: 50.0, name: "Mayonnaise", productDesc: productDescriptions[0])
let product2 = Product(initialWeight: 150.0, name: "Milk", productDesc: productDescriptions[1])
let product3 = Product(initialWeight: 100.0, name: "Hendricks", productDesc: productDescriptions[2])
let product4 = Product(initialWeight: 70.0, name: "Wine", productDesc: productDescriptions[3])

//let initialWeight: Float = 50.0
//var currentWeight: Float = 45.0
var productArray  : [Product] = [product1, product2, product3, product4]
//var percentage = ["33 %", "21 %", "10 %", "48 %"]
var myIndex = 0

class TableViewController: UITableViewController {


    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return productArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let percentageMeasure = String(Int(productArray[indexPath.row].currentWeight/productArray[indexPath.row].initialWeight*100))
        cell.textLabel?.text = productArray[indexPath.row].name + " " + percentageMeasure + "%"

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        myIndex = indexPath.row
        performSegue(withIdentifier: "segue", sender: self)
    }
    

}
