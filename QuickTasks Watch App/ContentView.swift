//
//  ContentView.swift
//  QuickTasks Watch App
//
//  Created by Rusheni Botheju on 2026-10-11.
//

import SwiftUI

struct ContentView: View {
    @State private var tasks: [TaskItem] = [
        TaskItem(
            title: "Morning Walk",
            completed: true,
            category: "Health",
            priority: .high
        ),
        TaskItem(
            title: "Drink Water",
            completed: false,
            category: "Health",
            priority: .medium
        ),
        TaskItem(
            title: "Read Notes",
            completed: false,
            category: "Study",
            priority: .medium
        ),
        TaskItem(
            title: "Call Home",
            completed: true,
            category: "Personal",
            priority: .low
        )
    ]

    private var completedCount: Int {
        tasks.filter { $0.completed }.count
    }

    private var progressPercentage: Int {
        guard !tasks.isEmpty else { return 0 }
        return Int((Double(completedCount) / Double(tasks.count)) * 100)
    }

    var body: some View {
        NavigationStack {
            List {
                // Header section: Completion count & progress percentage
                Section {
                    VStack(spacing: 2) {
                        Text("\(completedCount) / \(tasks.count) Completed")
                            .font(.headline)
                            .foregroundStyle(.primary)

                        Text("\(progressPercentage)% Complete")
                            .font(.caption2)
                            .foregroundStyle(.secondary)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.vertical, 2)
                }
                .listRowBackground(Color.clear)

                // Tasks section
                Section {
                    ForEach(tasks.indices, id: \.self) { index in
                        // Primary task row: Toggles completion
                        Button {
                            tasks[index].completed.toggle()
                        } label: {
                            HStack(spacing: 8) {
                                Image(
                                    systemName: tasks[index].completed
                                        ? "checkmark.circle.fill"
                                        : "circle"
                                )
                                .foregroundStyle(tasks[index].completed ? .green : .secondary)
                                .font(.title3)

                                Text(tasks[index].title)
                                    .foregroundStyle(tasks[index].completed ? .secondary : .primary)

                                Spacer()
                            }
                        }

                        // Separate details row: Navigates without touch conflict
                        NavigationLink {
                            TaskDetailView(task: tasks[index])
                        } label: {
                            HStack(spacing: 6) {
                                Image(systemName: "info.circle")
                                    .foregroundStyle(.blue)

                                Text("Details: \(tasks[index].title)")
                                    .font(.caption2)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }

                // Reset option
                Section {
                    Button(role: .destructive) {
                        resetAllTasks()
                    } label: {
                        Label("Reset Tasks", systemImage: "arrow.counterclockwise")
                    }
                }
            }
            .navigationTitle("Quick Tasks")
        }
    }

    private func resetAllTasks() {
        for index in tasks.indices {
            tasks[index].completed = false
        }
    }
}

#Preview {
    ContentView()
}
