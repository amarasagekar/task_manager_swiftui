//
//  ContentView.swift
//  TaskManager
//
//  Created by AMAR on 17/01/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var currentDate: Date = .init()
    @State var weekSlider:[Date.WeekDay] = []
    @State var currentWeekIndex: Int = 0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0, content: {
            VStack(alignment: .leading, content: {
                Text("Calendar")
                    .font(.system(size: 36, weight: .semibold))
                
                //WeekSlider
                TabView(selection: $currentWeekIndex,
                        content:  {
                    ForEach(weekSlider.indices, id: \.self){index in
                            let week = weekSlider[index]
                        
                        weekView(week)
                            .tag(index)
                    }
                })
                .tabViewStyle(.page(indexDisplayMode: .never))
                .frame(height: 90)
                
            })
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                Rectangle().fill(.gray.opacity(0.1))
                    .clipShape(.rect(bottomLeadingRadius: 30, bottomTrailingRadius: 30))
                    .ignoresSafeArea()
            )
            
            Spacer()
        })
        .frame(maxWidth: .infinity)
        .onAppear(){
            if weekSlider.isEmpty {
                let currentWeek = Date().fetchWeek()
                weekSlider.append(currentWeek)
            }
        }
    }
    
    //WeekView
    @ViewBuilder
    func weekView(_ week:[Date.WeekDay]) -> some View{
        HStack(spacing: 0){
            ForEach(week){day in
                VStack{
                    Text(day.date.format("E"))
                        .font(.callout)
                        .fontWeight(.medium)
                        .textScale(.secondary)
                        .foregroundStyle(.gray)
                    
                    Text(day.date.format("dd"))
                        .font(.system(size: 20))
                        .frame(width: 50, height: 55)
                        .foregroundStyle(isSameDate(day.date, currentDate) ? .white : .black)
                        .background(content:{
                            if isSameDate(day.date, currentDate){
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(.black)
                                    .offset(y: 3)
                            }
                            
                            if day.date.istoday {
                                Circle()
                                    .fill(.white)
                                    .frame(width:5, height: 5)
                                    .vSpacing(.bottom)
                            }
                        })
                }
            }
            
        }
    }
        
}



#Preview {
    ContentView()
}
