//
//  ContentView.swift
//  Step Tracker
//
//  Created by Tyler Burke on 8/22/24.
//

import SwiftUI

enum HealthMetricContext: CaseIterable, Identifiable{
    case steps, weight
    var id: Self { self }
    
    var title: String{
        switch self {
        case .steps:
            return "Steps"
        case .weight:
            return "Weight"
        }
    }
}

struct ContentView: View {
    
    @State private var SelectedStat: HealthMetricContext = .steps
    var isSteps: Bool { SelectedStat == .steps}
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack (spacing:20){
                    Picker("Selected Stat", selection: $SelectedStat){
                        ForEach(HealthMetricContext.allCases) {metric in
                            Text(metric.title)}
                    }
                    .pickerStyle(.segmented)
                    VStack{
                        NavigationLink(value: SelectedStat){
                            HStack{
                                VStack{
                                    Label("Steps", systemImage: "figure.walk")
                                        .font(.title3.bold())
                                        .foregroundStyle(.pink)
                                    
                                    Text("Avg: 10k steps")
                                        .font(.caption)
                                }
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                            }
                        }
                        .foregroundStyle(.secondary)
                        .padding(.bottom, 12)
                        
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundStyle(.secondary)
                            .frame(height: 150)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 12).fill(Color(.secondarySystemBackground)))
                    
                    VStack(alignment:.leading){
                        VStack(alignment:.leading){
                                Label("Averages", systemImage: "calendar")
                                    .font(.title3.bold())
                                    .foregroundStyle(.pink)
                                
                                Text("Last 28 Days")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                        
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundStyle(.secondary)
                            .frame(height: 240)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 12).fill(Color(.secondarySystemBackground)))
                }
            }
            .padding()
            .navigationTitle("Dashboard")
            .navigationDestination(for: HealthMetricContext.self) { metric in Text(metric.title)}
        }
        .tint(isSteps ? .pink : .indigo)
    }
}

#Preview {
    ContentView()
}
