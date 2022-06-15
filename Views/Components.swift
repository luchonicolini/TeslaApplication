//
//  Components.swift
//  TeslaApplication
//
//  Created by Luciano Nicolini on 15/06/2022.
//

import Foundation
import SwiftUI

struct FullButton: View {
    
    var text: String
    var icon: String
    var hasIcon = false
    
    var body: some View {
        if icon.isEmpty {
            textButton
        } else {
            iconButton
        }
    }
    var iconButton: some View {
        Label(text,systemImage: icon)
            .font(.title2)
            .font(.system(size: 14, weight: .semibold, design: .default))
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.white.opacity(0.05))
            .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 14, style: .continuous)
                    .stroke(Color.white.opacity(0.1),lineWidth: 0.5)
                
            )
    }
   
    var textButton: some View {
        Text(text)
            .font(.title2)
            .font(.system(size: 14, weight: .semibold, design: .default))
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.white.opacity(0.05))
            .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 14, style: .continuous)
                    .stroke(Color.white.opacity(0.1),lineWidth: 0.5)
                )
            }
        }
