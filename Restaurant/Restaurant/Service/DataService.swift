//
//  DataService.swift
//  Restaurant
//
//  Created by Wirendy on 09/08/19.
//  Copyright © 2019 Wirendy. All rights reserved.
//

import Foundation

class DataService {
    var age: Int
    var manCount : Int
    var womanCount : Int
    init() {
        // perform some initialization here
        self.age = 1
        self.manCount = 1
        self.womanCount = 1
    }
    func addManCount() -> Void{
        self.manCount = self.manCount + 1
    }
    func addWomanCount() -> Void{
        self.womanCount = self.womanCount + 1
    }
    func addAge(addAge: Int) -> Void {
        self.age = self.age + addAge
    }
    func calculateAverageAge() -> Int {
        var averageAge: Int = 0
        averageAge = self.age / (self.manCount + self.womanCount)
        return averageAge
    }
    func returnWomanCount() -> Int {
        return womanCount
    }
    func returnManCount() -> Int {
        return manCount
    }
}
