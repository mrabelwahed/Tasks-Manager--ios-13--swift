//
//  Task.swift
//  TableViewDemo
//
//  Created by MahmoudRamadan on 3/15/20.
//  Copyright © 2020 MahmoudRamadan. All rights reserved.
//

import Foundation
enum TaskType{
    case daily,weekly,monthly
}

struct Task{
    var name:String
    var type:TaskType
    var completed:Bool
    var lastCompleted:NSDate?
}
