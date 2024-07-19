//
//  Recipe.swift
//  Xeta-Assignment
//
//  Created by Shreyas Sahoo on 18/07/24.
//

import SwiftUI
struct NutritionItem: Identifiable {
    let id = UUID()
    let name: String
    let perServe: String
    let per250gm: String
}
struct Recipe: View {
    
    @StateObject var foodViewModel = FoodViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack{
                
                HeroView(foodViewModel: foodViewModel)
                
                Group {
                    DescriptionView(foodViewModel: foodViewModel)
                    
                    MacroNutrientsView(foodViewModel: foodViewModel)
                    
                    FactsView(foodViewModel: foodViewModel)
                    
                    SimilarItemsView(foodViewModel: foodViewModel)
                }
                    .padding()
            }
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    Recipe()
}

struct DescriptionView: View {
    @ObservedObject var foodViewModel : FoodViewModel
    var body: some View {
        VStack{
            VStack(alignment:.leading){
                Text("Description")
                    .font(.title3)
                    .bold()
                Text(foodViewModel.data?.data.description ?? "")
            }
            .padding(.bottom,5)
           
            
            
           
            
            
        }
        .padding(7)
        .onAppear{
            Task{
                foodViewModel.loadData()
            }
        }
    }
}

struct MacroNutrientsView: View {
    @ObservedObject var foodViewModel : FoodViewModel
    let nutritionData = [
        NutritionItem(name: "Energy", perServe: "415 J", per250gm: "600 J"),
        NutritionItem(name: "Protein", perServe: "2g", per250gm: "6g"),
        NutritionItem(name: "Trans Fat", perServe: "0.5g", per250gm: "1g"),
        NutritionItem(name: "Saturated Fat", perServe: "0.8g", per250gm: "0.8g"),
        NutritionItem(name: "Carbohydrates", perServe: "3g", per250gm: "5.5g"),
        NutritionItem(name: "Fibre", perServe: "4g", per250gm: "7.2g")
    ]
    var body: some View {
        VStack(alignment:.leading){
            Text("Macro Nutrients")
                .font(.title3)
                .bold()
            
            HStack {
                Spacer()
                VStack(spacing:0) {
                    HStack {
                        Spacer()
                        Text("Per Serve")
                            .frame(width: 60)
                        
                        Text("Per 250gm")
                            .frame(width: 63)
                    }
                    .padding(.bottom,8)
                    
                    Rectangle()
                        .frame(height: 1)
                        .frame(maxWidth: .infinity)
                        .padding(.bottom,8)
                    
                    
                    ScrollView(){
                        HStack(alignment:.top){
                            VStack {
                                ForEach(foodViewModel.data?.data.nutritionInfo ?? [],id: \.self) { nutritionInfo in
                                   
                                            Text(nutritionInfo.name)
                                                .fontWeight(.medium)
                                                .frame(width: 120, alignment: .leading)
                                        
                                }
                            }
                            VStack{
                                ForEach(foodViewModel.data?.data.nutritionInfo ?? [],id: \.self) { nutritionInfo in
                                    
                                    Text("\(Int(nutritionInfo.value)) \(nutritionInfo.units)")
                                        .frame(width: 60, alignment: .leading)
                                }
                            }
                            
                            
                            
                            VStack {
                                ForEach(foodViewModel.data?.data.nutritionInfoScaled ?? [],id: \.self){ nutritionInfo in
                                    Text("\(Int(nutritionInfo.value)) \(nutritionInfo.units)")
                                        .frame(width: 60, alignment: .leading)
                                    
                                }
                            }
                        }
                        

                        
                    }
                    .scrollIndicators(.never)
                }
                .font(.caption)
                .frame(width: 240, height: 129)
                .padding()
                .background(.applightpink)
                .cornerRadius(10)
                .shadow(radius: 5)
                Spacer()
            }
            
            
            
            
        }
    }
}

struct FactsView: View {
    @ObservedObject var foodViewModel : FoodViewModel
    var body: some View {
        VStack(alignment:.leading){
            Text("Facts")
                .font(.title3)
                .bold()
            ScrollView (.horizontal){
                LazyHStack{
                    ForEach(foodViewModel.data?.data.genericFacts ?? [], id:\.self){ fact in
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.appyellow)
                            .frame(width: 343,height :184)
                            .overlay{
                                VStack{
                                    Text("Did you know?")
                                        .padding(.bottom)
                                    Text(fact)
                                }
                                .foregroundStyle(.white)
                                .padding()
                            }
                    }
                }
            }
            .scrollIndicators(.never)
            
        }
    }
}

struct SimilarItemsView: View {
    @ObservedObject var foodViewModel : FoodViewModel
    var body: some View {
        VStack(alignment:.leading){
            
            Text("Similar Types")
                .font(.title3)
                .bold()
            
            ScrollView (.horizontal){
                LazyHStack{
                    ForEach(foodViewModel.data?.data.similarItems ?? [] , id:\.self) { item in
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.apporange)
                            .frame(width: 343,height :184)
                            .overlay{
                                    Text(item.name)
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.white)
                                    .padding()
                            }
                    }
                    
                }
            }
            .scrollIndicators(.never)
            
        }
    }
}

struct HeroView: View {
    @ObservedObject var foodViewModel : FoodViewModel
    var body: some View {
        VStack {
            Image("chicken")
                .resizable()
                .frame(maxWidth: .infinity)
                .overlay(alignment: .bottomLeading) {
                    HStack {
                        VStack(alignment: .leading){
                            Text("Food Information")
                                .font(.headline)
                            Text(foodViewModel.data?.data.name ?? "")
                                .font(.title2)
                        }
                        
                        
                        Spacer()
                        VStack{
                            Text(String(Int(foodViewModel.data?.data.healthRating ?? 0.0)))
                            Spacer()
                            Text("Out of 100")
                                .font(.caption)
                        }
                        
                        .padding(.vertical)
                        .padding(.horizontal,5)
                        .frame(height: 77)
                        .background(
                            .appdarkgray.opacity(0.15)
                            
                        )
                        
                        .clipShape(.rect(cornerRadius: 20))
                    }
                    .foregroundStyle(.white)
                    .bold()
                    .padding()
                    
                }
        }
    }
}
