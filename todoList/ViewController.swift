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
        datas.append("Todo\(datas.count)")
            tableView.reloadData()
    }
    

    
    /*@objc func deleteBtnAction(_ sender: UIButton) {
        let point = sender.convert(CGPoint.zero, to: tableView)
        guard let indexPath = tableView.indexPathForRow(at: point) else { return }
        datas.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    } */
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

