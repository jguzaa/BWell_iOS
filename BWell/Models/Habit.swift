//
//  Habit.swift
//  BWell
//
//  Created by Jongjet Wongsarapee on 23/8/21.
//

import Foundation
import RealmSwift

class Habit: Object {
    @objc dynamic var dateCreated: Date = Date()
    @objc dynamic var name: String = ""
    @objc dynamic var notificationTime: Date?
    @objc dynamic var todayFinish: Bool = false
    @objc dynamic var streak: Int = 0
    @objc dynamic var isSnoozed: Bool = false
    @objc dynamic var lastDayFinished: Date?
    @objc dynamic var finishPercentage: Int = 0
    @objc dynamic var habitType: Int = 0
    
    convenience init(name: String) {
        self.init()
        self.name = name
    }
}
