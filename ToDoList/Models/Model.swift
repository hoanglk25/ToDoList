//
//  File.swift
//  ToDoList
//
//  Created by Hoàng Đức on 17/11/2022.
//

import Foundation


struct TodoList {
    var goalDescription: String
    var term: String
    var expired: String
    
}

func fakeData() -> [TodoList] {
   
    
    let Todo1 = TodoList(goalDescription: "Eat salad twice a week", term: "Short Term", expired: "5")
    return [Todo1]
}
