//
//  Home.swift
//  Xeta-Assignment
//
//  Created by Shreyas Sahoo on 18/07/24.
//

import SwiftUI

struct Home: View {
    
    @StateObject var homeViewModel = HomeViewModel()
    
    
    var body: some View {
        
        ScrollView {
            VStack{
                
                HeaderView()
                
                Rectangle()
                    .fill(.white)
                    .shadow(color: .black, radius: 3, y: 3)
                    .frame(height: 1)
                    
                DateView()
                
                SetButtonView()
                
                StatsView()
                
                YourGoalsView(homeViewModel : homeViewModel)
                
                DietsView()

            }
            .onAppear{
                Task {
                    homeViewModel.loadData()
                }
        }
        }
        .scrollIndicators(.never)
           
    }
}

#Preview {
    Home()
}

struct HeaderView: View {
    var body: some View {
        HStack{
            Text("Dietsnap")
                .foregroundStyle(.appyellow)
                .font(.headline)
            Spacer()
            Image("Path 3476")
            Image("633914")
            Image("message-24px(1)")
                .scaleEffect(0.8)
        }
        .padding(.horizontal)
    }
}

struct DateView: View {
    
    static let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "EEEE, d'nd' MMM"
            return formatter
        }()
    
    var body: some View {
        VStack(alignment: .center){
            Text("Today")
                .bold()
                .font(.title2)
            Text("\(Date(), formatter: Self.dateFormatter)")
                .foregroundStyle(.secondary)
        }
        
        .padding(8)
    }
}

struct SetButtonView: View {
    var body: some View {
        HStack{
            
            ZStack(alignment:.center) {
                Text("SET GOAL!")
                    .font(.title)
                    .bold()
                Circle()
                    .stroke(.apppurple.opacity(0.5), lineWidth: 9)
                    .frame(width: 177, height: 177)
                
                Circle()
                    .stroke(.apporange.opacity(0.5), lineWidth: 9)
                    .frame(width: 221, height: 221)
                    .overlay(alignment: .top) {
                        Circle()
                            .fill(.apppurple)
                            .frame(width: 10,height: 9)
                            .padding(.top,18)
                    }
                Circle()
                    .stroke(.clear, lineWidth: 9)
                    .frame(width: 228, height: 228)
                    .overlay(alignment: .top) {
                        Circle()
                            .fill(.apporange)
                            .frame(width: 10,height: 9)
                            
                    }

                HStack{
                    Spacer()
                    Image("Disclosure")
                        .padding(.trailing,30)
                    
                }
            }
            
            
        }
    }
}

struct StatsView: View {
    var body: some View {
        VStack{
            HStack{
                HStack{
                    Image("Path 3065")
                    Text("Diet Pts")
                }
                HStack{
                    Image("ic_fitness_center_24px")
                    Text("Exercise Pts")
                }
            }
            .font(.callout)
            HStack(spacing:30){
                VStack{
                    Text("1500")
                        .foregroundStyle(.apporange)
                    Text("Days")
                        .foregroundStyle(.appgray)
                }
                VStack{
                    Text("3/5")
                        .foregroundStyle(.apporange)
                    Text("Cal")
                        .foregroundStyle(.appgray)
                }
                VStack{
                    Text("88")
                        .foregroundStyle(.apporange)
                    Text("Health Score")
                        .foregroundStyle(.appgray)
                }
            }
            HStack{
                Circle()
                    .fill(.apporange)
                    .frame(width: 10)
                Circle()
                    .fill(.applightgray)
                    .frame(width: 10)
                
            }
        }
    }
}

struct YourGoalsView: View {
    @ObservedObject var homeViewModel : HomeViewModel
    var body: some View {
        VStack (alignment:.leading){
            Text("Your Goals")
                .fontWeight(.semibold)
            RoundedRectangle(cornerRadius: 25)
                .fill(.appfaintgray)
                .frame(height: 100)
                .overlay{
                    HStack{
                        Image("Bitmap")
                        VStack(alignment:.leading){
                            Text(homeViewModel.data?.data.section1.planName ?? "")
                                .font(.subheadline)
                            Text("Current Major Goal")
                                .font(.caption)
                        }
                        .frame(maxWidth: 180)
                        Spacer()
                        ZStack(alignment:.center){
                            Text(homeViewModel.data?.data.section1.progress ?? "")
                                .font(.caption)
                            Circle()
                                .trim(from: 0.0, to: CGFloat(Int(homeViewModel.data?.data.section1.progress.replacingOccurrences(of: "%", with: "") ?? "") ?? 0) / 100.0)
                                .stroke(Color.apporange, style: StrokeStyle(lineWidth: 5, lineCap: .round))
                                .frame(width: 42, height: 42)
                        }
                        
                        
                    }
                    .padding()
                    
                }
        }
        .padding(.horizontal)
    }
}

struct DietsView: View {
    var body: some View {
        VStack (alignment:.leading,spacing: 16){
            Text("Explore")
                .fontWeight(.semibold)
            HStack{
                Image("Group 4051")
                VStack(alignment:.leading){
                    Text("Find Diets")
                        .font(.callout)
                        .padding(.bottom,5)
                    Text("Find premade diets according to your cuisine")
                        .foregroundStyle(.black.opacity(0.65))
                }
            }
            HStack{
                Image("Group 4053")
                VStack(alignment:.leading){
                    Text("Find Nutritionist")
                        .font(.callout)
                        .padding(.bottom,5)
                    Text("Get customized diets to achieve your health goal")
                        .foregroundStyle(.black.opacity(0.65))
                }
            }
        }
        .padding(.horizontal)
    }
}
