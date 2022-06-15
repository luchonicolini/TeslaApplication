//
//  Location.swift
//  TeslaApplication
//
//  Created by Luciano Nicolini on 15/06/2022.
//

import SwiftUI
import MapKit

struct CarLocation: Identifiable {
    let id = UUID()
    let latitude: Double
    let longitude: Double
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

let carLocations = [CarLocation(latitude: -34.59456806769477, longitude: -58.44749569460501)]

struct LocationView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var location = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -34.59456806769477, longitude: -58.44749569460501), span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
    //0.005 zoom
    
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $location, annotationItems: carLocations, annotationContent: { location in
                MapAnnotation(coordinate: location.coordinate, content: {CarPin()})
                
            })
            CarLocationPanel()
            LinearGradient(gradient: Gradient(colors: [Color.gray, Color.clear, Color.clear]), startPoint: .top, endPoint: .bottom)
                .allowsTightening(false)
            
            VStack {
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        GeneralButton(icon: "chevron.left")
                    }
                    Spacer()
                    Button(action: {}) {
                        GeneralButton(icon: "speaker.wave.2.fill")
                    }
                }
                .padding()
                Spacer()
            }
        }
        //Fondo
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("background"))
        .foregroundColor(.white)
        .navigationTitle("Mach Five")
        .navigationBarHidden(true)
    }
}

struct CarPin: View {
    var body: some View {
        VStack(alignment: .center, spacing: 4) {
            Image(systemName: "car.fill")
                .frame(width: 32, height: 32)
                .background(Color.blue)
                .clipShape(Circle())
                .foregroundColor(Color.white)
                .clipShape(Circle())
            Text("Mach Five")
                .font(.footnote)
                .fontWeight(.medium)
                .padding(.horizontal,8)
                .padding(.vertical,4)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 8, style: .continuous))
                .overlay(RoundedRectangle(cornerRadius: 8, style: .continuous).stroke(Color.black.opacity(0.1)))
        }
    }
}


struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}


struct CarLocationPanel: View {
    var body: some View {
        VStack {
            Spacer()
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Location")
                        .font(.title2)
                        .fontWeight(.semibold)
                        
                }
                CustomDivider()
                Label("Humbold 455 - Villa Crespo", systemImage: "location.fill")
                    .font(.headline)
                    .opacity(0.5)
                VStack(alignment: .leading, spacing: 10) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Summon")
                            .font(.title2)
                            .fontWeight(.semibold)
                           
                        Text("Press and hold controls to move vehicle")
                            .opacity(0.5)
                            .font(.footnote)
                    }
                    CustomDivider()
                    FullButton(text: "go to Target", icon: "")
                    HStack {
                        FullButton(text: "Forward", icon: "arrow.up")
                        FullButton(text: "Backward", icon: "arrow.down")
                        
                    }
                    
                }
                
                
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color("background"))
            .foregroundColor(.white)
        }
    }
}


//min 1:42:21
