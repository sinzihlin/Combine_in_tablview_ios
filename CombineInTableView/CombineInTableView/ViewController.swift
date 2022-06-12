//
//  ViewController.swift
//  CombineInTableView
//
//  Created by nick on 2022/6/4.
//
import Combine
import UIKit
class TheCell: UITableViewCell{
    
}


class ViewController: UIViewController {
    
    private let tableView: UITableView = {
      let table = UITableView()
        table.register(TheCell.self, forCellReuseIdentifier: "cell")
       return table
    }()
    
    var obseerver: AnyCancellable?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.dataSource = self
        obseerver = APICaller.shared.fetchData().sink(receiveCompletion: { complitation in
            //..
        }, receiveValue: { value in
            //...
        })
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TheCell else{
            fatalError()
        }
        return cell
     }
}
