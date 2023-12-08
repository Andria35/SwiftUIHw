//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Andria Inasaridze on 08.12.23.
//

import SwiftUI

struct ToDoListView: View {
    
    // MARK: - Struct Properties
    @State private var completedTasks: [Task] = [
        Task(toDo: "Task1", color: Color.mainColor, date: "4 Oct", isFinished: true),
        Task(toDo: "Task2", color: Color.mainColor, date: "4 Oct", isFinished: true),
        Task(toDo: "Task3", color: Color.mainColor, date: "4 Oct", isFinished: true),
        Task(toDo: "Task4", color: Color.mainColor, date: "4 Oct", isFinished: false),
        Task(toDo: "Task5", color: Color.mainColor, date: "4 Oct", isFinished: false)
    ]
    
    @State private var notCompletedTasks: [Task] = [
        Task(toDo: "Task6", color: Color.mainColor, date: "4 Oct", isFinished: false),
        Task(toDo: "Task7", color: Color.mainColor, date: "4 Oct", isFinished: false),
        Task(toDo: "Task8", color: Color.mainColor, date: "4 Oct", isFinished: false),
        Task(toDo: "Task9", color: Color.mainColor, date: "4 Oct", isFinished: false),
        Task(toDo: "Task10", color: Color.mainColor, date: "4 Oct", isFinished: false)
    ]
    
    // MARK: - Main Body
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                
                profileHStack
                completeAllButton
                
                Text("Progress")
                    .foregroundStyle(.white)
                    .font(.title)
                    .fontWeight(.semibold)
                
                progressVStack
                listView
                Spacer()
            }
            .padding()
        }
    }
    
    private func calculatePercentage() -> Int {
        let completedTasksCount = completedTasks.count
        let notCompletedTasksCount = notCompletedTasks.count
        let allTasksCount = completedTasksCount + notCompletedTasksCount
        return (completedTasksCount * 100) / allTasksCount
    }
}

// MARK: - ToDoListView Extension
extension ToDoListView {
    
    // MARK: - ProfileHStack
    var profileHStack: some View {
        HStack {
            
            Text("You Have \(notCompletedTasks.count) tasks to complete")
                .foregroundStyle(.white)
                .font(.title2)
                .fontWeight(.bold)
                .lineLimit(2)
                .frame(width: 188)
            
            Spacer()
            
            ZStack {
                Circle()
                    .fill(LinearGradient.mainGradient)
                
                Image("ProfileImage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
                
                ZStack {
                    Circle()
                        .foregroundStyle(Color(red: 1, green: 0.46, blue: 0.23))
                    Text("\(notCompletedTasks.count)")
                        .foregroundStyle(.white)
                        .bold()
                        .font(.system(size: 15))
                }
                .frame(width: 25, height: 20)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .bottomTrailing)
                .offset(x: -5, y: 5)
            }
            .frame(width: 44, height: 45)
            .overlay {
                
            }
        }
    }
    
    // MARK: - completeAllButton
    var completeAllButton: some View {
        Button(action: {
            withAnimation(.spring) {
                completedTasks.append(contentsOf: notCompletedTasks)
                notCompletedTasks = []
            }

        }, label: {
            Text("Complete All")
                .foregroundStyle(.white)
                .font(.title3)
                .fontWeight(.semibold)
                .padding(.vertical)
                .frame(maxWidth: .infinity, alignment: .center)
                .background(
                    LinearGradient.mainGradient
                )
                .clipShape(RoundedRectangle(cornerRadius: 10))
        })
    }
    
    // MARK: - progressVStack
    var progressVStack: some View {
        VStack(alignment: .leading) {
            Text("Daily Task")
                .foregroundStyle(.white)
            Text("\(completedTasks.count)/\(notCompletedTasks.count + completedTasks.count) Task Completed")
                .foregroundStyle(Color.white.opacity(0.7))
            HStack {
                Text("keep Working")
                    .foregroundStyle(Color.white.opacity(0.5))
                Spacer()
                Text("\(calculatePercentage())%")
                    .foregroundStyle(.white)
                    .padding(.trailing)
            }
        
            progressBar
            
        }
        .padding()
        .background(Color.secondaryBackgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 10))

    }
    
    // MARK: - ProgressBar
    var progressBar: some View {
        GeometryReader { proxy in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                .foregroundStyle(Color.mainColor.opacity(0.4))
                
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .frame(width: proxy.size.width * CGFloat(Double(calculatePercentage()) / 100))
                .foregroundStyle(Color.mainColor.opacity(1))
                
            }
        }
        .frame(height: 20)
    }
    
    // MARK: - listView
    var listView: some View {
        List {
            Section {
                ForEach(completedTasks, id: \.self) { task in
                    TaskView(task: task, isFinished: true, completedTasks: $completedTasks, notCompletedTasks: $notCompletedTasks)
                        .listRowBackground(Color.black)
                }
            } header: {
                Text("Completed Tasks")
                    .foregroundStyle(.white)
                    .font(.title)
                    .fontWeight(.semibold)
                    .listRowBackground(Color.black)
            }
            
            Section {
                ForEach(notCompletedTasks, id: \.self) { task in
                    TaskView(task: task, isFinished: false, completedTasks: $completedTasks, notCompletedTasks: $notCompletedTasks)
                        .listRowBackground(Color.black)
                }
            } header: {
                Text("Not Completed Tasks")
                    .foregroundStyle(.white)
                    .font(.title)
                    .fontWeight(.semibold)
                    .listRowBackground(Color.black)
            }

        }
        .background(Color.black)
        .listStyle(.plain)
    }
}

// MARK: - Preview
#Preview {
    ToDoListView()
}
