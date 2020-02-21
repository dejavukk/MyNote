//
//  MemoFormVC.swift
//  MyNote
//
//  Created by JunHyuk on 2020/02/20.
//  Copyright © 2020 junhyuk. All rights reserved.
//

import UIKit

class MemoFormVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate {
    
    // 내용의 첫 줄을 추춘하여 제목으로 사용하는 변수.
    var subject: String!
    
    @IBOutlet var contents: UITextView!
    @IBOutlet var preview: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.contents.delegate = self
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // 메모 저장
    @IBAction func save(_ sender: Any) {
        
        
    }
    
    // 텍스트뷰에 텍스트 내용이 변경될 때마다 호출되는 메소드.
    func textViewDidChange(_ textView: UITextView) {
        
        let contents = textView.text as NSString
        let length = ((contents.length > 15) ? 15 : contents.length)
        self.subject = contents.substring(with: NSRange(location: 0, length: length))
        
        self.navigationItem.title = subject
        
    }
    
    
    
    
    // 이미지 가져오기.
    @IBAction func pick(_ sender: Any) {
        
        // 인스턴스 생성
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.allowsEditing = true
        
        // 이미지 피커 화면 표시
        self.present(picker, animated: false)
        
    }
    
    // 이미지를 선택했을 때 호출되는 메소드
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // 선택된 이미지를 미리보기에 표시
        self.preview.image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        
        // 이미지 피커 컨트롤러를 닫는다.
        picker.dismiss(animated: false)
        
    }
}
