//
//  Constants.swift
//  BWell
//
//  Created by Jongjet Wongsarapee on 23/8/21.
//

import Foundation

struct K {
    
    static let DashboardCell = "DashboardCell"
    
    static let HabitTypes = [K.HabitType.DailyTracking, K.HabitType.AlarmClock, K.HabitType.Jogging]
    
    struct HabitType {
        static let DailyTracking = "Daily Tracking"
        static let AlarmClock = "Alarm Clock"
        static let Jogging = "Jogging"
    }
    
    struct Segue {
        static let DashboardToCreateHabit = "toCreateHabit"
    }
    
}

