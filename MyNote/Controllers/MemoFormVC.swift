//
//  MemoFormVC.swift
//  MyNote
//
//  Created by JunHyuk on 2020/02/20.
//  Copyright © 2020 junhyuk. All rights reserved.
//

import UIKit

// MARK: - 메모 작성 뷰컨트롤러
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
    
    
    // 메모 저장
    @IBAction func save(_ sender: Any) {
        
        // 1. 내용을 입력하지 않았을 경우 경고얼럿 발생.
        guard self.contents.text?.isEmpty == false else {
            let alert = UIAlertController(title: nil, message: "내용을 입력해주세요.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
            
            return
        }
        
        // 2. MemoData 객체를 생성, 데이터를 담는다.
        let data = MemoData()
        
        data.title = self.subject
        data.contents = self.contents.text
        data.image = self.preview.image
        data.regdate = Date()
        
        // 3. 앱 델리게이트 객체를 읽어온 뒤, memoList배열에 memoData객체를 추가한다.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.memolist.append(data)
        
        // 4. 작성폼 화면을 종료하고, 이전화면으로 되돌아간다.
        _ = self.navigationController?.popViewController(animated: true)
        
        
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
        
        let alert = UIAlertController(title: "이미지를 가져올 곳을 선택해주세요.", message: "", preferredStyle: .actionSheet)
        
        let library =  UIAlertAction(title: "사진앨범", style: .default) { (action) in self.openLibrary()

        }


        let camera =  UIAlertAction(title: "카메라", style: .default) { (action) in

        self.openCamera()

        }


        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)


        alert.addAction(library)

        alert.addAction(camera)

        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)

        // 인스턴스 생성
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.allowsEditing = true
        
        // 이미지 피커 화면 표시
        self.present(picker, animated: false)
        
    }
    
    func openLibrary(){

      picker.sourceType = .photoLibrary

      present(picker, animated: false, completion: nil)

    }

    func openCamera(){

      picker.sourceType = .camera

      present(picker, animated: false, completion: nil)

    }


    
    // 이미지를 선택했을 때 호출되는 메소드
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // 선택된 이미지를 미리보기에 표시
        self.preview.image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        
        // 이미지 피커 컨트롤러를 닫는다.
        picker.dismiss(animated: false)
        
    }
}
