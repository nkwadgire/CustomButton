//
//  ContentView.swift
//  SwiftUIButtonExample-iOS
//
//  Created by Nagraj Wadgire on 08/01/25.
//

import SwiftUI
import SwiftUIButton

struct ContentView: View {
    @State private var showAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    var body: some View {
        let automaticButton: SwiftUIButton.ButtonType<PlainButtonStyle, Color> = .automaticButton(title: "Automatic Button", buttonWidth: 200.0, buttonHeight: 50.0, font: .title3, fontWidth: .standard, foregroundStyle: .green, padding: 5) {
            automaticButtonAction()
        }
        
        let borderedButton: SwiftUIButton.ButtonType<PlainButtonStyle, Color> = .borderedButton(title: "Bordered Button", buttonWidth: 200.0, buttonHeight: 50.0, font: .title3, fontWidth: .standard, foregroundStyle: .red, padding: 5) {
            showAlert(title: "Bordered Button", message: "You clicked the Bordered button.")
        }
        
        let borderedProminentButton: SwiftUIButton.ButtonType<PlainButtonStyle, Color> = .borderedProminantButton(title: "Bordered Prominent Button", buttonHeight: 50.0, font: .title3, fontWidth: .standard, foregroundStyle: .black, padding: 5) {
            showAlert(title: "Bordered Prominent Button", message: "You clicked the Bordered Prominent button.")
        }
        
        let borderlessButton: SwiftUIButton.ButtonType<PlainButtonStyle, Color> = .borderlessButton(title: "Borderless Button", buttonWidth: 200.0, buttonHeight: 50.0, font: .title3, fontWidth: .standard, foregroundStyle: .yellow, padding: 5) {
            showAlert(title: "Borderless Button", message: "You clicked the Borderless button.")
        }
        
        let imageButton: SwiftUIButton.ButtonType<PlainButtonStyle, Color> = .imageButton(imageName: "SampleImage", buttonWidth: 100, buttonHeight: 50, buttonStyle: .plain, buttonBorderShape: .circle, foregroundStyle: .red, padding: 5) {
            showAlert(title: "Image Button", message: "You clicked the Image button.")
        }
        
        let iconText: SwiftUIButton.ButtonType<BorderedButtonStyle, Color> = .iconTextButton(imageName: "square.and.arrow.down.fill", title: "Icon Text Button", buttonHeight: 50, font: .title3, fontWidth: .standard, fontWeight: .regular, buttonStyle: BorderedButtonStyle.bordered, buttonBorderShape: .capsule, foregroundStyle: .green, padding: 5) {
            showAlert(title: "Icon and Text Button", message: "You clicked the Icon and Text button.")
        }
        
        let textIcon: SwiftUIButton.ButtonType<BorderedButtonStyle, Color> = .textIconButton(imageName: "square.and.arrow.down.fill", title: "Text Icon Button", buttonWidth: 400, buttonHeight: 50, font: .title3, fontWeight: .regular, buttonStyle: BorderedButtonStyle.bordered, buttonBorderShape: .capsule, foregroundStyle: .green, padding: 5) {
            showAlert(title: "Text and Icon Button", message: "You clicked the Text and Icon button.")
        }
        
        let iconButton: SwiftUIButton.ButtonType<PlainButtonStyle, Color> = .iconButton(iconName: "square.and.arrow.down.fill", buttonWidth: 100, buttonHeight: 10, buttonStyle: .plain, buttonBorderShape: .circle, foregroundStyle: .red) {
            showAlert(title: "Icon Button", message: "You clicked the Icon button.")
        }
        
        let destructiveButton: SwiftUIButton.ButtonType<PlainButtonStyle, Color> = .destructiveButton(title: "Destructive", buttonHeight: 50, buttonStyle: .plain) {
            showAlert(title: "Destructive Button", message: "You clicked the Destructive button.")
        }
        
        let cancelButton: SwiftUIButton.ButtonType<PlainButtonStyle, Color> = .cancelButton(title: "Cancel", buttonWidth: 200, buttonHeight: 50, buttonStyle: .plain) {
            showAlert(title: "Cancel Button", message: "You clicked the Cancel button.")
        }
        
        VStack(spacing: 5) {
            SwiftUIButton.createButton(for: SwiftUIButton.ButtonType<DefaultButtonStyle, Color>.plainButton(title: "Plain Button", action: {
                showAlert(title: "Plain Button", message: "You clicked the Plain button.")
            }))
            SwiftUIButton.createButton(for: automaticButton)
            SwiftUIButton.createButton(for: borderedButton)
            SwiftUIButton.createButton(for: borderedProminentButton)
            SwiftUIButton.createButton(for: borderlessButton)
            SwiftUIButton.createButton(for: imageButton)
            SwiftUIButton.createButton(for: iconText)
            SwiftUIButton.createButton(for: textIcon)
            SwiftUIButton.createButton(for: iconButton)
            SwiftUIButton.createButton(for: destructiveButton)
            SwiftUIButton.createButton(for: cancelButton)
        }
        .alert(alertTitle, isPresented: $showAlert) {
            Button("OK", role: .cancel) {}
        } message: {
            Text(alertMessage)
        }
    }
    
    func automaticButtonAction() {
        showAlert(title: "Automatic Button", message: "You clicked the Automatic button.")
    }
    
    private func showAlert(title: String, message: String) {
        alertTitle = title
        alertMessage = message
        showAlert = true
    }
}

