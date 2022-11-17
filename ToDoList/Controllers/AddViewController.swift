//
//  AddViewController.swift
//  ToDoList
//
//  Created by Hoàng Đức on 16/11/2022.
//

import UIKit

class AddViewController: UIViewController {

     let headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGreen
        return view
    }()
    var goalType:String?
    
    private let titleLable: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "GOAL POST"
        title.font = .systemFont(ofSize: 18, weight: .medium)
        title.textColor = .white
        return title
    }()
        private let backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
     let goalTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Your Goal:"
        textView.textColor = .lightGray
        textView.layer.borderWidth = 0.5
        textView.layer.cornerRadius = 10
        textView.layer.borderColor = UIColor.systemGreen.cgColor
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
     let shortTermButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("SHORT TERM", for: .normal)
        button.backgroundColor = .systemGreen
        return button
    }()
     let longTermButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("LONG TERM", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.6980392157, green: 0.8666666667, blue: 0.6862745098, alpha: 1)
        return button
    }()
     let nextButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("NEXT", for: .normal)
        button.backgroundColor = .systemGreen
        return button
    }()
    
    var dayTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .numberPad
        textField.placeholder = "Expired"
        textField.textAlignment = .center
        textField.backgroundColor = .secondarySystemBackground
        textField.textColor = .red
        textField.font = .systemFont(ofSize: 25, weight: .bold)
       return textField
    }()
    
    var todoList: TodoList = TodoList(goalDescription: "", term: "", expired: "")
    var handelSave: ((TodoList) -> Void)?
    
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setUp()
        goalTextView.delegate = self
        backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        shortTermButton.addTarget(self, action: #selector(didTapShortTermButton), for: .touchUpInside)
        longTermButton.addTarget(self, action: #selector(didTapLongTermButton), for: .touchUpInside)
        dayTextField.inputAccessoryView = nextButton
        goalTextView.inputAccessoryView = nextButton
        nextButton.addTarget(self, action: #selector(didTapNextButton), for: .touchUpInside)
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
        
        
        headerView.addSubview(backButton)
        backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        backButton.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -20).isActive = true
        
        view.addSubview(goalTextView)
        goalTextView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 20).isActive = true
        goalTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        goalTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        goalTextView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        view.addSubview(shortTermButton)
        shortTermButton.topAnchor.constraint(equalTo: goalTextView.bottomAnchor, constant: 20).isActive = true
        shortTermButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        shortTermButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        shortTermButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        view.addSubview(longTermButton)
        longTermButton.topAnchor.constraint(equalTo: goalTextView.bottomAnchor, constant: 20).isActive = true
        longTermButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
        longTermButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        longTermButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        view.addSubview(nextButton)
        nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: view.bounds.width).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(dayTextField)
        dayTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        dayTextField.topAnchor.constraint(equalTo: shortTermButton.bottomAnchor, constant: 30).isActive = true
        dayTextField.heightAnchor.constraint(equalToConstant: 60).isActive = true
        dayTextField.widthAnchor.constraint(equalTo: dayTextField.heightAnchor, multiplier: 2).isActive = true
    }
    @objc func didTapBackButton() {
        dismiss(animated: true)
    }
    
    @objc func didTapShortTermButton() {
        shortTermButton.backgroundColor = .systemGreen
        longTermButton.backgroundColor = #colorLiteral(red: 0.6980392157, green: 0.8666666667, blue: 0.6862745098, alpha: 1)
        goalType = "Short Term"
    }
    
    @objc func didTapLongTermButton() {
        shortTermButton.backgroundColor = #colorLiteral(red: 0.6980392157, green: 0.8666666667, blue: 0.6862745098, alpha: 1)
        longTermButton.backgroundColor = .systemGreen
        goalType = "Long Term"
    }
    
    @objc func didTapNextButton() {
        view.endEditing(true)
        if goalTextView.text != "" || goalTextView.text != "Your Goal:" || dayTextField.text != "" {
            todoList.goalDescription = goalTextView.text
            todoList.term = goalType ?? ""
            todoList.expired = dayTextField.text ?? ""
            handelSave?(todoList)
            dismiss(animated: true)
        }
    }
}
extension AddViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        self.goalTextView.textColor = .label
        self.goalTextView.text = ""
    }
}
