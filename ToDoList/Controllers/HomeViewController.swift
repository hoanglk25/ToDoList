//
//  ViewController.swift
//  ToDoList
//
//  Created by Hoàng Đức on 16/11/2022.
//

import UIKit



class HomeViewController: UIViewController {
    var todoLists:[TodoList] = fakeData()
  
    private let headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGreen
       return view
    }()
    
    private let titleLable: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "GOAL POST"
        title.font = .systemFont(ofSize: 18, weight: .medium)
        title.textColor = .white
        return title
    }()
    
    private let addButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    private let goalTableView: UITableView = {
       let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        addButton.addTarget(self, action: #selector(didTapAddButton), for: .touchUpInside)
        setUp()
        
        goalTableView.delegate = self
        goalTableView.dataSource = self
        
        let nib = UINib(nibName: "GoalTableViewCell", bundle: nil)
        goalTableView.register(nib, forCellReuseIdentifier: "GoalTableViewCell")
        goalTableView.reloadData()
        
    }
    private func setUp() {
        view.addSubview(headerView)
        headerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        headerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        headerView.rightAnchor.constraint(equalTo: view.rightAnchor , constant: 0).isActive = true
        headerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        headerView.addSubview(titleLable)
        titleLable.centerXAnchor.constraint(equalTo: headerView.centerXAnchor, constant: 0).isActive = true
        titleLable.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -20).isActive = true
        
        headerView.addSubview(addButton)
        addButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        addButton.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -20).isActive = true
        
        view.addSubview(goalTableView)
        goalTableView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 10).isActive = true
        goalTableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        goalTableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        goalTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
    }
    
    @objc func didTapAddButton() {
        let vc = AddViewController()
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .flipHorizontal
        
        vc.handelSave = { newTodo in
            self.todoLists.append(newTodo)
            self.goalTableView.reloadData()
        }
        present(vc, animated: true)
       
    }
}
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        return print("Goal Post")
    }
}
extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoLists.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GoalTableViewCell", for: indexPath) as? GoalTableViewCell else {return UITableViewCell()}
        cell.goalLabel.text = todoLists[indexPath.row].goalDescription
        cell.goalTerm.text = todoLists[indexPath.row].term
        cell.dayLabel.text = todoLists[indexPath.row].expired
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Goals"
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .normal, title: "Delete") { context, view, closure in
            
            self.todoLists.remove(at: indexPath.row)
            self.goalTableView.reloadData()
        }
        let addAction = UIContextualAction(style: .normal, title: "Add") { context, view, closure in
            
            
            self.goalTableView.reloadData()
        }
        deleteAction.backgroundColor = .red
        addAction.backgroundColor = .systemGreen
        let configuretion = UISwipeActionsConfiguration(actions: [deleteAction, addAction])
        return configuretion
    }
}
