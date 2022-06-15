//
//  CarControlView.swift
//  TeslaApplication
//  aplicacion parte dos
//  Created by Luciano Nicolini on 12/06/2022.
//  1:01:42

import SwiftUI

let carControls: [ActionItem] = [
    ActionItem(iconName: "flashlight.on.fill", text: "Flash"),
    ActionItem(iconName: "flashlight.on.fill", text: "Flash"),
    ActionItem(iconName: "flashlight.on.fill", text: "Flash"),
    ActionItem(iconName: "flashlight.on.fill", text: "Flash")
]


struct CarControlView: View {
    //dismis
    @Environment(\.presentationMode) var presentationMode
    @State private var toggleValent: Bool = false
    
    var body: some View {
        ScrollView() {
            VStack(spacing: 20) {
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                        GeneralButton(icon: "chevron.left")
                        }
                        
                        Spacer()
                    }
                    Text("Car Control")
                        .font(.title)
                        .fontWeight(.semibold)
                }
                CustomDivider()
                CarLookButton()
                CustomDivider()
                CarControlActions()
                CustomDivider()
                
                HStack {
                    Text("Valet Mode")
                        .fontWeight(.medium)
                        Spacer()
                    Toggle("",isOn: $toggleValent)
                }
                if toggleValent {
                    Text("hola")
                }
            }
            .padding()
        }
        //FondoColor
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("background"))
        .foregroundColor(.white)
        .navigationTitle("Mach Five")
        .navigationBarHidden(true)
    }
}


struct CarControlView_Previews: PreviewProvider {
    static var previews: some View {
        CarControlView()
    }
}

struct CarLookButton: View {
    var body: some View {
        Button(action: {}) {
            FullButton(text: "Unlock Car", icon: "lock.fill")

        }
    }
}

struct CarControlActions: View {
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Spacer()
                ActionButton(item: carControls[0])
                Spacer()
                ActionButton(item: carControls[0])
                Spacer()
                ActionButton(item: carControls[0])
                Spacer()
            }
            HStack {
                Spacer()
                ActionButton(item: carControls[0])
                Spacer()
                ActionButton(item: carControls[0])
                Spacer()
                
            }
        }
        .padding()
    }
}
