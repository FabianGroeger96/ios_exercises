//
//  ViewController.swift
//  ComAndCon
//
//  Created by Fabian Gröger on 23.10.18.
//  Copyright © 2018 Fabian Gröger HSLU. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, XMLParserDelegate {

    @IBOutlet weak var pickerView: UIPickerView!
    
    let dummyStrings : [String] = ["One", "Two", "Three"]
    var pickerStrings : [String] = []
    var tmpXmlStrings : [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.dataSource = self
        pickerStrings = dummyStrings
    }
    
    @IBAction func dataSourceChangePressed(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 1:
            pickerStrings = getXMLData()
            pickerView.reloadAllComponents()
        case 2:
            pickerStrings = getJSONData()
            pickerView.reloadAllComponents()
        default:
            pickerStrings = dummyStrings
            pickerView.reloadAllComponents()
        }
    }
    
    @IBAction func testOperationQueueButtonPressed(_ sender: UIButton) {
        var orderArray : [String] = []
        
        let blockOp1 = BlockOperation(block: { orderArray.append("1")})
        let blockOp2 = BlockOperation(block: { orderArray.append("2")})
        let blockOp3 = BlockOperation(block: { orderArray.append("3")})
        
        blockOp1.addDependency(blockOp2)
        blockOp1.addDependency(blockOp3)
        blockOp2.addDependency(blockOp3)
        
        let operationQueue = OperationQueue()
        let blocks : [Operation] = [blockOp1, blockOp2, blockOp3]
        operationQueue.addOperations(blocks, waitUntilFinished: true)
        
        let orderString = orderArray.joined(separator: ", ")
        let alertController = UIAlertController(
            title: "Block Operation Ordering",
            message: "The three block operations where executed in the following order: " + orderString + ".",
            preferredStyle: UIAlertController.Style.alert
        )
        let alertOKAction = UIAlertAction(
            title: "OK, thanx",
            style: UIAlertAction.Style.default,
            handler: nil
        )
        alertController.addAction(alertOKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func getXMLData() -> [String] {
        let xmlURL = URL(string: "https://wherever.ch/hslu/iPhoneAdressData.xml")
        let parser = XMLParser(contentsOf: xmlURL!)!
        parser.delegate = self
        parser.parse()
        return tmpXmlStrings
    }
    
    func getJSONData() -> [String] {
        var tmpJsonStrings : [String] = []
        
        let jsonURL = URL(string: "https://wherever.ch/hslu/iPhoneAdressData.json")
        let rawData = try! Data(contentsOf: jsonURL!)
        
        let jsonData = try! JSONSerialization.jsonObject(with: rawData)
        
        for item in jsonData as! [[String: Any]] {
            let firstName: String = item["firstName"] as! String
            let lastName: String = item["lastName"] as! String
            tmpJsonStrings.append(firstName + " " + lastName)
        }
        
        return tmpJsonStrings
    }
    
    // MARK: Implement Protocol UIPickerViewDelegates
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerStrings[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //selectedValueLabel.text = pickerStrings[row]
    }
    
    // MARK: Implement Protocol UIPickerViewDataSource
    func numberOfComponents(in: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerStrings.count
    }
    
    // MARK: Implement Protocol XML ParserDelegate
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        if elementName == "Entry" {
            tmpXmlStrings.append(attributeDict["firstName"]! + " " + attributeDict["lastName"]!)
        }
    }

}

