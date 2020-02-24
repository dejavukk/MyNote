//
//  MemoListVC.swift
//  MyNote
//
//  Created by JunHyuk on 2020/02/20.
//  Copyright © 2020 junhyuk. All rights reserved.
//

import UIKit

class MemoListVC: UITableViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    
    // 앱의 생명주기 관련.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    // 앱의 생명주기 관련, 화면이 나타날 때 호출되는 메소드.
    override func viewWillAppear(_ animated: Bool) {
        <#code#>
    }

    // 테이블 행의 개수를 결정하는 메소드.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let count = self.appDelegate.memolist.count
        return count
    }
    
    // 테이블 행을 구성하는 메소드.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        


    }
    
}
