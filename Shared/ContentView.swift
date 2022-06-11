//
//  ContentView.swift
//  Shared
//
//  Created by Luciano Nicolini on 10/06/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            ScrollView() {
                VStack(spacing: 20) {
                    HomeHeader()
                    CustomDivider()
                    CarSection()
                    CustomDivider()
                    CategoryView(tilte: "Quick Shortcust", actionItems: index)
                    CustomDivider()
                    CategoryView(tilte: "Recent Actions", actionItems: indexx)
                }
                .padding()
            }
            
            VoiceCommandButton()
            
        }
        //FondoColor
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("background"))
        .foregroundColor(.white)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//Microfono
struct VoiceCommandButton: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Image(systemName: "mic.fill")
                    .font(.system(size: 24,weight: .semibold,design: .default))
                    .frame(width: 64, height: 64)
                    .background(Color.white)
                    .foregroundColor(.black)
                    .clipShape(Circle())
                    .padding()
                    .shadow(radius: 10)
                
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

//Comienzo
struct HomeHeader: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("Model 3".uppercased())
                    .font(.caption2)
                    .fontWeight(.medium)
                    .padding(.vertical,4)
                    .padding(.horizontal,8)
                    .foregroundColor(Color.white)
                    .background(Color.red)
                    .clipShape(Capsule())
                Text("Mach Five 3")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                
            }
            Spacer()
            HStack {
                Button(action:  {}) {
                GeneralButton(icon: "lock.fill")
                }
                Button(action:  {}) {
                GeneralButton(icon: "gear")
                }
                
            }
        }
        .padding(.top)
    }
}

struct GeneralButton: View {
    var icon: String
    
    var body: some View {
        Image(systemName: icon)
            .imageScale(.large)
            .frame(width: 44, height: 44)
            .background(Color.white.opacity(0.15))
            .clipShape(Circle())
        
    }
}

struct CustomDivider: View {
    var body: some View {
        Rectangle()
            .frame(maxWidth: .infinity)
            .frame(height: 0.25)
            .background(Color.white)
            .opacity(0.1)
    }
}

struct CarSection: View {
    var body: some View {
        VStack(spacing: 10) {
            HStack(alignment: .center) {
                HStack() {
                    Image(systemName: "battery.75")
                        .foregroundColor(.green)
                    Text("237 miles".uppercased())
                        .foregroundColor(.green)
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text("Luciano")
                            .fontWeight(.medium)
                        Text("Last updated: 5 min ago")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            Image("Tesla")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}

struct CategoryHeader: View {
    var tilte: String
    var showEdit: Bool = false
        
    var body: some View {
        HStack {
            Text(tilte)
                .font(.title2)
                .fontWeight(.semibold)
            Spacer()
            if showEdit {
                Button(action: {}) {
                    Text("hola")
                        .foregroundColor(.gray)
                        .fontWeight(.medium)
                }
            }
        }
    }
}

struct CategoryView: View {
    var tilte: String
    var shoEdit: Bool = false
    var actionItems: [ActionItem]
    
    var body: some View {
        VStack {
            CategoryHeader(tilte: tilte, showEdit: shoEdit)
            ScrollView(.horizontal,showsIndicators: false) {
                HStack(alignment: .top) {
                    ForEach(actionItems, id: \.self) { item in
                        ActionButton(item: item)
                        
                    }
                }
            }
        }
    }
}

struct ActionButton: View {
    var item: ActionItem
    
    var body: some View {
        VStack(alignment: .center) {
            GeneralButton(icon: item.iconName)
            Text(item.text)
                .frame(width: 96)
                .font(.system(size: 12, weight: .semibold,design: .default))
                .multilineTextAlignment(.center)
                
            
        }
    }
}

//Model
struct ActionItem: Hashable {
    var iconName: String
    var text: String
}

let index: [ActionItem] = [
    ActionItem(iconName: "bolt.fill", text: "Electricidad"),
    ActionItem(iconName: "fanblades.fill", text: "Climatizador"),
    ActionItem(iconName: "play.fill", text: "Medi"),
    ActionItem(iconName: "bolt.car", text: "Corriente electrica")
]

let indexx: [ActionItem] = [
    ActionItem(iconName: "bolt.fill", text: "Electricidad"),
    ActionItem(iconName: "fanblades.fill", text: "Climatizador"),
    ActionItem(iconName: "play.fill", text: "Medi")
]



//42:50
