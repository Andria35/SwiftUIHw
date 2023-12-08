//
//  TaskView.swift
//  ToDoList
//
//  Created by Andria Inasaridze on 08.12.23.
//

import SwiftUI

struct TaskView: View {
    
    //MARK: - Struct Properties
    let task: Task
    @State var isFinished: Bool
    @Binding var completedTasks: [Task]
    @Binding var notCompletedTasks: [Task]
        
    
    // MARK: - Main Body
    var body: some View {
        
        HStack(alignment: .center) {
            VStack(alignment: .leading) {
                Text(task.toDo)
                    .foregroundStyle(.white)
                HStack(spacing: 10) {
                    Image(systemName: "calendar")
                    Text(task.date)
                }
                .foregroundStyle(.white.opacity(0.7))
            }
            
            Spacer()
            
            Button(action: {
                withAnimation(.spring){
                    isFinished.toggle()
                    taskFinishedClicked()
                }
            }, label: {
                Image(systemName: isFinished ? "checkmark.circle.fill" : "circle")
                    .foregroundStyle(Color.mainColor)
                    .font(.title3)
            })
        }
        .padding()
        .frame(height: 80)
        .background(Color.secondaryBackgroundColor)
        .padding(.leading)
        .background(task.color)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
    private func taskFinishedClicked() {
        if isFinished {
            completedTasks.append(Task(toDo: task.toDo, color: task.color, date: task.date, isFinished: true))
            notCompletedTasks.removeAll(where: {$0.id == task.id})
        } else {
            notCompletedTasks.append(Task(toDo: task.toDo, color: task.color, date: task.date, isFinished: false))
            completedTasks.removeAll(where: {$0.id == task.id})
        }
    }
}

// MARK: - Preview
#Preview {
    TaskView(task: Task(toDo: "Mobile App Research", color: Color.mainColor, date: "4 Oct", isFinished: false), isFinished: true, completedTasks: .constant([]), notCompletedTasks: .constant([]))
}
