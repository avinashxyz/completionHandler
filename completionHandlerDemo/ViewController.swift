//
//  ViewController.swift
//  completionHandlerDemo
//
//  Created by AVINASH on 24/02/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var catImage: UIImageView!
    
    
    @IBOutlet weak var dessertImage: UIImageView!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    let myURLS = (dessertURL:"https://cdn.arstechnica.net/wp-content/uploads/2018/06/macOS-Mojave-Dynamic-Wallpaper-transition.jpg" ,
                  
        catURL:"https://i.imgur.com/w5rkSIj.jpg")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        DispatchQueue.main.async {
//            myCompletionHandler(URLString:self.myURLS.catURL /*"Wait Your Task In progress...."*/) { (result) in
//
//                self.catImage.image = UIImage(data:result)
//                print("Result",result)
//
//            }
            
           myCompletionHandler() { (result) in

           self.catImage.image = UIImage(data:result)
            }
        
     
        
     
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.async {
         //   self.spinner.startAnimating()
        }
       
        
    }
    
   
    
    @IBAction func myBtn(_ sender: UIButton) {
        
        print("############")
    }
    
  //  func myCompletionHandler(/*URLString:String, completion: @escaping(_ result:*/completion:@escaping(Data)->Void)
     func myCompletionHandler(completion:@escaping(Data)->Void)
    {
        spinner.startAnimating()
        print("Inside function")
      //  print("Message",URLString)
        
        DispatchQueue.main.async/*After(deadline: .now() + 5)*/ {
          
        let url = URL(string: self.myURLS.catURL)
        let data = try? Data(contentsOf: url!)

        self.spinner.stopAnimating()
        self.spinner.isHidden = true
            
            if let data = data {
        completion(data)
            }
    }
        print("Message after completion ...... ")
    }
       
    /////
    
//    func myCompletionHandler(URLString:String, completion: @escaping(_ result:Data)->Void)
//    {
//        spinner.startAnimating()
//        print("Inside function")
//        print("Message",URLString)
//
//        DispatchQueue.main.async/*After(deadline: .now() + 5)*/ {
//
//        let url = URL(string: URLString/*self.myURLS.catURL*/)
//        let data = try? Data(contentsOf: url!)
//
//        self.spinner.stopAnimating()
//        self.spinner.isHidden = true
//
//            if let data = data {
//        completion(data)
//            }
//    }
//        print("Message after completion ...... ")
//    }
    ///

}

