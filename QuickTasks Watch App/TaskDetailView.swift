//
//  TaskDetailView.swift
//  QuickTasks Watch App
//
//  Created by Rusheni Botheju on 2026-10-11.
//

import SwiftUI

struct TaskDetailView: View {
    let task: TaskItem

    var body: some View {
        ScrollView {
            VStack(spacing: 8) {
                Image(
                    systemName: task.completed
                        ? "checkmark.circle.fill"
                        : "circle"
                )
                .font(.largeTitle)
                .foregroundStyle(task.completed ? .green : .secondary)

                Text(task.title)
                    .font(.headline)
                    .multilineTextAlignment(.center)

                Text(task.completed ? "Completed" : "Pending")
                    .font(.caption)
                    .foregroundStyle(task.completed ? .green : .orange)

                Divider()

                VStack(spacing: 6) {
                    HStack {
                        Text("Category:")
                            .font(.caption2)
                            .foregroundStyle(.secondary)
                        Spacer()
                        Text(task.category)
                            .font(.caption2)
                            .bold()
                    }

                    HStack {
                        Text("Priority:")
                            .font(.caption2)
                            .foregroundStyle(.secondary)
                        Spacer()
                        Text(task.priority.rawValue)
                            .font(.caption2)
                            .bold()
                            .foregroundStyle(priorityColor(task.priority))
                    }
                }
                .padding(.horizontal, 4)
            }
            .padding(.vertical, 4)
        }
        .navigationTitle("Details")
    }

    private func priorityColor(_ priority: TaskPriority) -> Color {
        switch priority {
        case .high:
            return .red
        case .medium:
            return .yellow
        case .low:
            return .blue
        }
    }
}

#Preview {
    TaskDetailView(
        task: TaskItem(
            title: "Morning Walk",
            completed: true,
            category: "Health",
            priority: .high
        )
    )
}
