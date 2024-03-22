//
//  ViewController.swift
//  todoList
//
//  Created by t2023-m0074 on 3/21/24.
//

import UIKit
    
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var datas = ["Todo 1", "Todo 2", "Todo 3", "Todo 4"] // 버튼눌럿을떼 동작만들기 append하게 만들고 리로드까지 같이 실행되게
   
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUITableView()
        // Do any additional setup after loading the view.
    }
    @IBAction func addButton(_ sender: UIButton) {

        let title = "Todo List"
        let message = "추가하기"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        let ok = UIAlertAction(title: "추가", style: .default) { (_) in
            if let txt = alert.textFields?[0]{
                      if txt.text?.isEmpty != true {
                          print("입력값 \(txt.text!)")
                      } else {
                          print("입력된 값이 없습니다.")
                      }
                  }
            self.datas.append(txt.text)
            self.tableView.reloadData()
        }
        
        alert.addAction(cancel)
        alert.addAction(ok)
        
        
        self.present(alert, animated: true)
        alert.addTextField(){ (tf) in
            tf.placeholder = String()
            
    
    
      
        }
    }
   
    
    func setUITableView() {
        
       // let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = self.view.bounds
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        self.view.addSubview(tableView)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = datas[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected: \(datas[indexPath.row])")
        tableView.deselectRow(at: indexPath, animated: true)
    }

}

