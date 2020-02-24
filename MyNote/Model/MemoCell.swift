//
//  MemoCell.swift
//  MyNote
//
//  Created by JunHyuk on 2020/02/20.
//  Copyright © 2020 junhyuk. All rights reserved.
//

import UIKit

class MemoCell: UITableViewCell {
    
    
    // 이미지가 표현된 셀의 아웃렛변수 추가
    @IBOutlet var subject: UILabel!
    @IBOutlet var contents: UILabel!
    @IBOutlet var regdate: UILabel!
    @IBOutlet var img: UIImageView!
    
}
