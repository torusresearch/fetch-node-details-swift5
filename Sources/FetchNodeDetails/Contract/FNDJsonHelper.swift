//
//  File.swift
//  
//
//  Created by Dhruv Jaiswal on 06/05/22.
//

import Foundation


class FNDJsonHelper{
    
    func getJsonFile(name:String) throws -> Any {
        let path = Bundle.module.url(forResource: "abi", withExtension: "json")
        if let path = path{
            let data = try Data(contentsOf: URL(fileURLWithPath: path.path))
              let jsonResult = try JSONSerialization.jsonObject(with: data)
              return jsonResult
    }
        else{
        throw FNDError.infoFailed
        }
    }
    
    func jsonToString(json: Any) throws -> String{
            let data1 =  try JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted) // first of all convert json to the data
        if let convertedString = String(data: data1, encoding: String.Encoding.utf8){ // the data will be converted to the string
            return convertedString
        }
        else{
            throw FNDError.infoFailed
        }
        }
    
    func loadABIFile() -> String{
        do{
        let file = try getJsonFile(name: "abi")
        let str = try jsonToString(json: file)
            print(str)
        return str
        }
        catch(let err){
            fatalError(err.localizedDescription)
        }
    }
    
        
}
