//
//  TaskItem.swift
//  QuickTasks Watch App
//
//  Created by Rusheni Botheju on 2026-10-11.
//  

import Foundation

enum TaskPriority: String, CaseIterable, Identifiable {
    case low = "Low"
    case medium = "Medium"
    case high = "High"

    var id: String { rawValue }
}

struct TaskItem: Identifiable {
    
    let id: UUID
    var title: String
    var completed: Bool
    var category: String
    var priority: TaskPriority

    init(
        id: UUID = UUID(),
        title: String,
        completed: Bool = false,
        category: String = "General",
        priority: TaskPriority = .medium
    ) {
        self.id = id
        self.title = title
        self.completed = completed
        self.category = category
        self.priority = priority
    }
}
