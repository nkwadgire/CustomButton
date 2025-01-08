//
//  ContentView.swift
//  CustomButtonExample-iOS
//
//  Created by Nagraj Wadgire on 06/01/25.
//

import SwiftUI
import CustomUIComponents

struct ContentView: View {
    @State private var showAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    var body: some View {
        let automaticButton: CustomButton.ButtonType<PlainButtonStyle, Color> = .automaticButton(title: "Automatic Button", buttonWidth: 200.0, buttonHeight: 50.0, font: .title3, fontWidth: .standard, foregroundStyle: .green, padding: 5) {
            automaticButtonAction()
        }
        
        let borderedButton: CustomButton.ButtonType<PlainButtonStyle, Color> = .borderedButton(title: "Bordered Button", buttonWidth: 200.0, buttonHeight: 50.0, font: .title3, fontWidth: .standard, foregroundStyle: .red, padding: 5) {
            showAlert(title: "Bordered Button", message: "You clicked the Bordered button.")
        }
        
        let borderedProminentButton: CustomButton.ButtonType<PlainButtonStyle, Color> = .borderedProminantButton(title: "Bordered Prominent Button", buttonHeight: 50.0, font: .title3, fontWidth: .standard, foregroundStyle: .black, padding: 5) {
            showAlert(title: "Bordered Prominent Button", message: "You clicked the Bordered Prominent button.")
        }
        
        let borderlessButton: CustomButton.ButtonType<PlainButtonStyle, Color> = .borderlessButton(title: "Borderless Button", buttonWidth: 200.0, buttonHeight: 50.0, font: .title3, fontWidth: .standard, foregroundStyle: .yellow, padding: 5) {
            showAlert(title: "Borderless Button", message: "You clicked the Borderless button.")
        }
        
        let imageButton: CustomButton.ButtonType<PlainButtonStyle, Color> = .imageButton(imageName: "SampleImage", buttonWidth: 100, buttonHeight: 50, buttonStyle: .plain, buttonBorderShape: .circle, foregroundStyle: .red, padding: 5) {
            showAlert(title: "Image Button", message: "You clicked the Image button.")
        }
        
        let iconText: CustomButton.ButtonType<BorderedButtonStyle, Color> = .iconTextButton(imageName: "square.and.arrow.down.fill", title: "Icon Text Button", buttonHeight: 50, font: .title3, fontWidth: .standard, fontWeight: .regular, buttonStyle: BorderedButtonStyle.bordered, buttonBorderShape: .capsule, foregroundStyle: .green, padding: 5) {
            showAlert(title: "Icon and Text Button", message: "You clicked the Icon and Text button.")
        }
        
        let textIcon: CustomButton.ButtonType<BorderedButtonStyle, Color> = .textIconButton(imageName: "square.and.arrow.down.fill", title: "Text Icon Button", buttonWidth: 400, buttonHeight: 50, font: .title3, fontWeight: .regular, buttonStyle: BorderedButtonStyle.bordered, buttonBorderShape: .capsule, foregroundStyle: .green, padding: 5) {
            showAlert(title: "Text and Icon Button", message: "You clicked the Text and Icon button.")
        }
        
        let iconButton: CustomButton.ButtonType<PlainButtonStyle, Color> = .iconButton(iconName: "square.and.arrow.down.fill", buttonWidth: 100, buttonHeight: 10, buttonStyle: .plain, buttonBorderShape: .circle, foregroundStyle: .red) {
            showAlert(title: "Icon Button", message: "You clicked the Icon button.")
        }
        
        let destructiveButton: CustomButton.ButtonType<PlainButtonStyle, Color> = .destructiveButton(title: "Destructive", buttonHeight: 50, buttonStyle: .plain) {
            showAlert(title: "Destructive Button", message: "You clicked the Destructive button.")
        }
        
        let cancelButton: CustomButton.ButtonType<PlainButtonStyle, Color> = .cancelButton(title: "Cancel", buttonWidth: 200, buttonHeight: 50, buttonStyle: .plain) {
            showAlert(title: "Cancel Button", message: "You clicked the Cancel button.")
        }
        
        VStack(spacing: 5) {
            CustomButton.createButton(for: CustomButton.ButtonType<DefaultButtonStyle, Color>.plainButton(title: "Plain Button", action: {
                showAlert(title: "Plain Button", message: "You clicked the Plain button.")
            }))
            CustomButton.createButton(for: automaticButton)
            CustomButton.createButton(for: borderedButton)
            CustomButton.createButton(for: borderedProminentButton)
            CustomButton.createButton(for: borderlessButton)
            CustomButton.createButton(for: imageButton)
            CustomButton.createButton(for: iconText)
            CustomButton.createButton(for: textIcon)
            CustomButton.createButton(for: iconButton)
            CustomButton.createButton(for: destructiveButton)
            CustomButton.createButton(for: cancelButton)
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
