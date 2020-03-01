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

    
    // 앱의 생명주기 관련. 최초에 뷰가 로드되는 시점에만 호출.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    // 앱의 생명주기 관련, 해당 뷰 컨트롤러가 기기 스크린에 출력될 때마다 호출되는 메소드.
    override func viewWillAppear(_ animated: Bool) {
        
        // 테이블 데이터를 다시 읽는다.  행을 구성하는 로직이 다시 실행
        self.tableView.reloadData()
        
    }

    // 테이블 행의 개수를 결정하는 메소드.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let count = self.appDelegate.memolist.count
        
        return count
    }
    
    // 테이블 행을 구성하는 메소드.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 1. memolist 배열 데이터에서 주어진 행에 맞는 데이터를 꺼낸다.
        let row = self.appDelegate.memolist[indexPath.row]
        
        // 2. 이미지속성이 비어있을 경우 "memoCell" 아니면 "memoCellWithImage"
        let cellId = row.image == nil ? "memoCell" : "memoCellWithImage"
        
        // 3. 재사용 큐로부터 프로토타입셀의 인스턴스를 전달받는다.
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! MemoCell
        
        // 4. memoCell의 내용을 구성한다.
        cell.subject?.text = row.title
        cell.contents?.text = row.contents
        cell.img?.image = row.image
        
        // 5. Date 타입의 날짜를 포맷에 맞게 변경한다. ex) yyyy-mm-dd HH:mm:ss
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        cell.regdate?.text = formatter.string(from: row.regdate!)
        
        // 6. cell 객체를 리턴한다.
        return cell

    }
    
    // 테이블 행을 선택했을 때 호출되는 메소드.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // 1. memolist 배열에서 선택된 행에 맞는 데이터를 꺼낸다.
        let row = self.appDelegate.memolist[indexPath.row]
        
        // 2. 상세 화면의 인스턴스 생성.
        guard let vc = self.storyboard?.instantiateViewController(identifier: "MemoRead") as? MemoReadVC else {
            
            return
        }
        // 3. 값을 전달한 다음, 상세 화면으로 이동.
        vc.param = row
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
