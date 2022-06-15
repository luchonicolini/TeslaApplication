//
//  ContentView.swift
//  Shared
//
//  Created by Luciano Nicolini on 10/06/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
        ZStack {
            ScrollView() {
                VStack(spacing: 20) {
                    HomeHeader()
                    CustomDivider()
                    CarSection()
                    CustomDivider()
                    CategoryView(tilte: "Quick Shortcust", actionItems: index)
                    CustomDivider()
                    CustomDivider()
                    CategoryView(tilte: "Recent Actions", actionItems: indexx)
                    AllSetting()
                    ReorderButton()
                    
                }
                .padding()
            }
            
            VoiceCommandButton()
            
        }
        //FondoColor
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("background"))
        .foregroundColor(.white)
        .navigationTitle("Mach Five")
        .navigationBarHidden(true)
        }
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

//Button
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

//Divider
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

//ModelDate
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

//42:50 Setting

struct AllSetting: View {
    var body: some View {
        VStack {
            CategoryHeader(tilte: "All Setting")
            LazyVGrid(columns: [GridItem(.fixed(170)),GridItem(.fixed(170))]) {
                //NavigationLink
                NavigationLink(destination: CarControlView()) {
                SettingBlock(icon: "car.fill", tilte: "Controls", subtilte: "")
                }
                SettingBlock(icon: "fanblades.fill", tilte: "Climate", subtilte: "Interior 60* F*", backgroundColor: Color(.blue))
                NavigationLink(destination: LocationView()) {
                    SettingBlock(icon: "location.fill", tilte: "Location", subtilte: "Empire State Building")
                }
                
                SettingBlock(icon: "checkerboard.shield", tilte: "Security", subtilte: "0 events detected")
                SettingBlock(icon: "sparkle", tilte: "Upgrades", subtilte: "3 upgrades avaliable")
            }
        }
    }
}

//ConfigSetting
struct SettingBlock: View {
    
    var icon: String
    var tilte: String
    
    var subtilte: String
    var backgroundColor: Color = Color.white.opacity(0.05)
    
    var body: some View {
        HStack(alignment: .center, spacing: 2) {
            Image(systemName: icon)
            VStack(alignment: .leading, spacing: 4) {
                
                Text(tilte)
                    .fontWeight(.semibold)
                    .font(.system(size: 14, weight: .medium, design:
                            .default))
                
                
                
                Text(subtilte.uppercased())
                    .font(.system(size: 8, weight: .medium, design:
                            .default))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .lineLimit(1)
                
            }
            .padding(.leading,5)
            Spacer()
            Image(systemName: "chevron.right")
        }
        .padding(.horizontal,8)
        .padding(.vertical,16)
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.white.opacity(0.1),lineWidth: 0.5))
    }
}

//Button
struct ReorderButton: View {
    var body: some View {
        Button(action: {}) {
            Text("Recorder Groups")
                .font(.caption)
                .padding(.vertical,8)
                .padding(.horizontal,14)
                .background(Color.white.opacity(0.05))
                .clipShape(Capsule())
        }
    }
}
