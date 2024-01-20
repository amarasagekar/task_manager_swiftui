//
//  NewTask.swift
//  TaskManager
//
//  Created by AMAR on 19/01/24.
//

import SwiftUI

struct Newtask: View{
    @Environment(\.dismiss) var dismiss
    @State private var taskTitle: String = ""
    @State private var taskDate: Date = .init()
    @State private var taskColor: Color = .yellow
    
    var body: some View{
        VStack(alignment: .leading, content: {
            VStack(alignment: .leading, content: {
               Label("Add new task", systemImage: "arrow.left")
                    .onTapGesture {
                        dismiss()
                    }
            })
            .hSpacing(.leading)
            .padding(30)
            .frame(maxWidth: .infinity)
            .background{
                Rectangle().fill(.gray.opacity(0.1))
                    .clipShape(.rect(bottomLeadingRadius: 30, bottomTrailingRadius: 30))
                    .ignoresSafeArea()
            }
            
            //Task title
            VStack(alignment: .leading,spacing: 30, content: {
                VStack(spacing: 20, content: {
                    TextField("Your Task Title", text:$taskTitle)
                    
                    Divider()
                })
                
                VStack(alignment: .leading,spacing: 20, content: {
                    Text("Timeline")
                        .font(.title3)
                    
                    DatePicker("", selection: $taskDate)
                        .datePickerStyle(.compact)
                })
                
                VStack(alignment: .leading, spacing: 20, content: {
                    Text("Task Color")
                        .font(.title3)
                    
                    let colors: [Color] = [.yellow, .gray, .green, .blue, .indigo, .red]
                    
                    HStack(spacing: 10, content: {
                        ForEach(colors, id:\.self){ color in
                         Circle()
                                .fill(color.opacity(0.4))
                                .hSpacing(.center)
                        }
                    })
                })
                
            })
            .padding(30)
            .vSpacing(.top)
            Button{
                
            } label: {
                Text("Create Task")
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .hSpacing(.bottom)
                    .foregroundStyle(.white)
                    .background(.black)
                    .clipShape(.rect(cornerRadius: 20))
                    .padding(.horizontal, 30)
                
            }
        })
        .vSpacing(.top)
    }
    
}

#Preview {
    Newtask()
}

