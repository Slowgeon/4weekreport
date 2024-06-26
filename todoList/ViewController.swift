//
//  ViewController.swift
//  todoList
//
//  Created by t2023-m0074 on 3/21/24.
//

import UIKit
    
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var datas = ["Todo 1", "Todo 2", "Todo 3"] // 버튼눌럿을떼 동작만들기 append하게 만들고 리로드까지 같이 실행되게
   
    @IBOutlet weak var tableView: UITableView!
    private func registerXib() {
               let nibName = UINib(nibName: "TableViewCell", bundle: nil)
               tableView.register(nibName, forCellReuseIdentifier: "TableViewCell")
           }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUITableView()
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TableViewCell")
    }
   
// 추가하기버튼 Alert 컨트롤러 구현
    @IBAction func addButton(_ sender: UIButton) {
        let title = "Todo List"
        let message = "추가하기"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        let ok = UIAlertAction(title: "추가", style: .default) { (_) in
            if let txt = alert.textFields?[0]{
                if let inputValue = txt.text, !inputValue.isEmpty {
                          print("입력값 \(inputValue)")
                    self.datas.append(inputValue)
                    self.tableView.reloadData()
                      } else {
                          print("입력된 값이 없습니다.")
            }
        }
    }
        alert.addAction(cancel)
        alert.addAction(ok)
        
        self.present(alert, animated: true)
        alert.addTextField(){ (tf) in
            tf.placeholder = String()
      
        }
    }
   
    // tableView 리스트 초기화면 구현
    func setUITableView() {
        
       // let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = self.view.bounds
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        
       // self.view.addSubview(tableView)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) // 변경필요
        cell.textLabel?.text = datas[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected: \(datas[indexPath.row])")
        tableView.deselectRow(at: indexPath, animated: true)
    
    }
    // Todo리스트 스와이프로 삭제기능구현코드
    func tableView(_ tableView: UITableView, editingStyleForRowat indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            datas.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }

}

// Todo 리스트 스위치작동시 완료표시 코드구현
extension String {
    func strikeThrough() -> NSAttributedString {
        let attributeString = NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, attributeString.length))
        return attributeString
    }
}

