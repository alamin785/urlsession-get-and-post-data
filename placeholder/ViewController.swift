//
//  ViewController.swift
//  placeholder
//
//  Created by alamin on 3/28/19.
//  Copyright © 2019 alamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
      // get()
        post()
        
    }
    
    func get(){
        
        
        let url = URL(string:"https://jsonplaceholder.typicode.com/users")
        
       URLSession.shared.dataTask(with: url!) { (data, response, error) in
        if let response = response{
            print(response)
        }
        if let data = data{
            print(data)
            do{
              let js = try JSONSerialization.jsonObject(with: data, options:[] )
                print(js)
            }catch{
                print(error)
                
            }
            
        }
            
    
        }.resume()
    
    }
    
    func post(){
        
        let dic = ["alamin":"@gamail","sakib":"@gmail"]
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
       var request = URLRequest(url: url!)
        
        request.httpMethod = "POST"
        
        let body = try? JSONSerialization.data(withJSONObject: dic, options: [])
        
        request.httpBody = body
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let response = response{
                print(response)
            }
            if let data = data{
                print(data)
                do{
                    let js = try JSONSerialization.jsonObject(with: data, options:[] )
                    print(js)
                }catch{
                    print(error)
                    
                }
                
            }
            
            
            }.resume()
        
    }

}

