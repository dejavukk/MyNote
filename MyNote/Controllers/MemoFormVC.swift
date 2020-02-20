//
//  MemoFormVC.swift
//  MyNote
//
//  Created by JunHyuk on 2020/02/20.
//  Copyright © 2020 junhyuk. All rights reserved.
//

import UIKit

class MemoFormVC: UIViewController {
    
    var subject: String!
    
    @IBOutlet var contents: UITextView!
    @IBOutlet var preview: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func save(_ sender: Any) {
    }
    
    @IBAction func pick(_ sender: Any) {
    }
    
    

}
