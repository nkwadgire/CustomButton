//
//  CustomUIComponents.swift
//  CustomUIComponents
//
//  Created by Nagraj Wadgire on 24/12/24.
//

import SwiftUI

public struct SwiftUIButton {
    enum ButtonTypeRawValue: String {
        case plainButton = "plainButton"
        case automaticButton = "automaticButton"
        case borderedButton = "borderedButton"
        case borderedProminantButton = "borderedProminantButton"
        case borderlessButton = "borderlessButton"
        case imageButton = "imageButton"
        case iconTextButton = "iconTextButton"
        case textIconButton = "textIconButton"
        case iconButton = "iconButton"
        case destructiveButton = "destructiveButton"
        case cancelButton = "cancelButton"
    }
  
   public enum ButtonType<T: PrimitiveButtonStyle, S: ShapeStyle>  {
        case plainButton(title: String, buttonWidth: CGFloat? = nil, buttonHeight: CGFloat? = nil, font: Font? = nil, fontWidth: Font.Width? = nil, fontWeight: Font.Weight? = nil, fontDesign: Font.Design? = nil, buttonBorderShape: ButtonBorderShape? = nil, foregroundStyle: S? = nil, tint: Color? = nil,  controlSize: ControlSize? = nil, padding: CGFloat? = nil, accessibility: Text? = nil, action: () -> Void)
        
        case automaticButton(title: String, buttonWidth: CGFloat? = nil, buttonHeight: CGFloat? = nil, font: Font? = nil, fontWidth: Font.Width? = nil, fontWeight: Font.Weight? = nil, fontDesign: Font.Design? = nil, buttonBorderShape: ButtonBorderShape? = nil, foregroundStyle: S? = nil, tint: Color? = nil, controlSize: ControlSize? = nil, padding: CGFloat? = nil, accessibility: Text? = nil, action: () -> Void)
        
        case borderedButton(title: String, buttonWidth: CGFloat? = nil, buttonHeight: CGFloat? = nil, font: Font? = nil, fontWidth: Font.Width? = nil, fontWeight: Font.Weight? = nil, fontDesign: Font.Design? = nil, buttonBorderShape: ButtonBorderShape? = nil, foregroundStyle: S? = nil, tint: Color? = nil, controlSize: ControlSize? = nil, padding: CGFloat? = nil, accessibility: Text? = nil, action: () -> Void)
        
        case borderedProminantButton(title: String, buttonWidth: CGFloat? = nil, buttonHeight: CGFloat? = nil, font: Font? = nil, fontWidth: Font.Width? = nil, fontWeight: Font.Weight? = nil, fontDesign: Font.Design? = nil, buttonBorderShape: ButtonBorderShape? = nil, foregroundStyle: S? = nil, tint: Color? = nil, controlSize: ControlSize? = nil, padding: CGFloat? = nil, accessibility: Text? = nil, action: () -> Void)
        
        case borderlessButton(title: String, buttonWidth: CGFloat? = nil, buttonHeight: CGFloat? = nil, font: Font? = nil, fontWidth: Font.Width? = nil, fontWeight: Font.Weight? = nil, fontDesign: Font.Design? = nil, buttonBorderShape: ButtonBorderShape? = nil, foregroundStyle: S? = nil, tint: Color? = nil, controlSize: ControlSize? = nil, padding: CGFloat? = nil, accessibility: Text? = nil, action: () -> Void)
        
        case imageButton(imageName: String, buttonWidth: CGFloat? = nil, buttonHeight: CGFloat? = nil, buttonStyle: T? = nil, buttonBorderShape: ButtonBorderShape? = nil, foregroundStyle: S? = nil, padding: CGFloat? = nil, accessibility: Text? = nil, action: () -> Void)
        
        case iconTextButton(imageName: String, title: String, buttonWidth: CGFloat? = nil, buttonHeight: CGFloat? = nil, font: Font? = nil, fontWidth: Font.Width? = nil, fontWeight: Font.Weight? = nil, fontDesign: Font.Design? = nil, buttonStyle: T? = nil, buttonBorderShape: ButtonBorderShape? = nil, foregroundStyle: S? = nil, padding: CGFloat? = nil, accessibility: Text? = nil, action: () -> Void)
        
        case textIconButton(imageName: String, title: String, buttonWidth: CGFloat? = nil, buttonHeight: CGFloat? = nil, font: Font? = nil, fontWidth: Font.Width? = nil, fontWeight: Font.Weight? = nil, fontDesign: Font.Design? = nil, buttonStyle: T? = nil, buttonBorderShape: ButtonBorderShape? = nil, foregroundStyle: S? = nil, padding: CGFloat? = nil, accessibility: Text? = nil, action: () -> Void)
        
        case iconButton(iconName: String, buttonWidth: CGFloat? = nil, buttonHeight: CGFloat? = nil, buttonStyle: T? = nil, buttonBorderShape: ButtonBorderShape? = nil, foregroundStyle: S? = nil, padding: CGFloat? = nil, accessibility: Text? = nil, action: () -> Void)
        
        case destructiveButton(title: String? = "", buttonWidth: CGFloat? = nil, buttonHeight: CGFloat? = nil, font: Font? = nil, fontWidth: Font.Width? = nil, fontWeight: Font.Weight? = nil, fontDesign: Font.Design? = nil, buttonStyle: T? = nil, buttonBorderShape: ButtonBorderShape? = nil, tint: Color? = nil, controlSize: ControlSize? = nil, padding: CGFloat? = nil, accessibility: Text? = nil, action: () -> Void)
        
        case cancelButton(title: String? = "", buttonWidth: CGFloat? = nil, buttonHeight: CGFloat? = nil, font: Font? = nil, fontWidth: Font.Width? = nil, fontWeight: Font.Weight? = nil, fontDesign: Font.Design? = nil, buttonStyle: T? = nil, buttonBorderShape: ButtonBorderShape? = nil, tint: Color? = nil, controlSize: ControlSize? = nil, padding: CGFloat? = nil, accessibility: Text? = nil, action: () -> Void)
    }
    
    static func buttonBuilder<T: PrimitiveButtonStyle, S: ShapeStyle>(
        buttonType: ButtonTypeRawValue,
        imageName: String? = "",
        title: String? = "",
        buttonWidth: CGFloat? = nil,
        buttonHeight: CGFloat? = nil,
        font: Font? = nil,
        fontWidth: Font.Width? = nil,
        fontWeight: Font.Weight? = nil,
        fontDesign: Font.Design? = nil,
        buttonStyle: T? = nil,
        buttonBorderShape: ButtonBorderShape? = nil,
        foregroundStyle: S? = nil,
        tint: Color? = nil,
        controlSize: ControlSize? = nil,
        padding: CGFloat? = nil,
        accessibility: Text? = nil,
        action: @escaping () -> Void
    ) -> AnyView {
       
        let btn =  Button(action: action) {
            switch buttonType {
            case .imageButton:
                Image(imageName ?? "")
                    .resizable()
            case .iconTextButton:
                HStack {
                    Image(systemName: imageName ?? "")
                    Text(title ?? "")
                }
            case .textIconButton:
                HStack {
                    Text(title ?? "")
                    Image(systemName: imageName ?? "")
                }
            case .iconButton:
                Image(systemName: imageName ?? "")
            default:
                Text(title ?? "")
            }
        }
        .modifier(if: buttonWidth != nil) { $0.frame(width:buttonWidth)}
        .modifier(if: buttonHeight != nil) { $0.frame(height:  buttonHeight)}
        .modifier(if: font != nil) { $0.font(font)}
        .modifier(if: fontWidth != nil) {$0.fontWidth(fontWidth)}
        .modifier(if: fontWeight != nil) { $0.fontWeight(fontWeight)}
        .modifier(if: fontDesign != nil) {$0.fontDesign(fontDesign)}
        .modifier(if: buttonStyle != nil) { $0.buttonStyle(buttonStyle ?? PlainButtonStyle.plain as! T)}
        .modifier(if: buttonBorderShape != nil) { $0.buttonBorderShape(buttonBorderShape ?? ButtonBorderShape.automatic)}
        .modifier(if: foregroundStyle != nil) { $0.foregroundStyle(foregroundStyle ?? Color.primary as! S)}
        .modifier(if: tint != nil) { $0.tint(tint)}
        .modifier(if: controlSize != nil) { $0.controlSize(controlSize ?? .regular)}
        .modifier(if: padding != nil) { $0.padding(padding ?? 0.0)}
        .modifier(if: accessibility != nil) { $0.accessibility(label:accessibility ?? Text(""))}
        return AnyView(btn)
    }
    
    public static func createButton<T: PrimitiveButtonStyle, S: ShapeStyle>(for type: ButtonType<T, S>) -> AnyView {
        switch type {
        case .plainButton(let title, let buttonWidth, let buttonHeight, let font, let fontWidth, let fontWeight, let fontDesign, let buttonBorderShape, let foregroundStyle, let tint, let controlSize, let padding, let accessibility, let action):
            
            let plainButton = SwiftUIButton.buttonBuilder(buttonType: .plainButton, title: title, buttonWidth: buttonWidth, buttonHeight: buttonHeight, font: font, fontWidth: fontWidth, fontWeight: fontWeight, fontDesign: fontDesign, buttonStyle: PlainButtonStyle.plain, buttonBorderShape: buttonBorderShape, foregroundStyle: foregroundStyle, tint: tint, controlSize: controlSize, padding: padding, accessibility: accessibility, action: action)
            
            return plainButton
            
        case .automaticButton(let title, let buttonWidth, let buttonHeight, let font, let fontWidth, let fontWeight, let fontDesign, let buttonBorderShape, let foregroundStyle, let tint, let controlSize, let padding, let accessibility, let action):
           
            let automaticButton = SwiftUIButton.buttonBuilder(buttonType: .automaticButton, title: title, buttonWidth: buttonWidth, buttonHeight: buttonHeight, font: font, fontWidth: fontWidth, fontWeight: fontWeight, fontDesign: fontDesign, buttonStyle: DefaultButtonStyle.automatic, buttonBorderShape: buttonBorderShape, foregroundStyle: foregroundStyle, tint: tint, controlSize: controlSize, padding: padding, accessibility: accessibility, action: action)
            return automaticButton
            
        case .borderedButton(let title, let buttonWidth, let buttonHeight, let font, let fontWidth, let fontWeight, let fontDesign, let buttonBorderShape, let foregroundStyle, let tint, let controlSize, let padding, let accessibility, let action):
            
            let borderedButton = SwiftUIButton.buttonBuilder(buttonType: .borderedButton, title: title, buttonWidth: buttonWidth, buttonHeight: buttonHeight, font: font, fontWidth: fontWidth, fontWeight: fontWeight, fontDesign: fontDesign, buttonStyle: BorderedButtonStyle.bordered, buttonBorderShape: buttonBorderShape, foregroundStyle: foregroundStyle, tint: tint, controlSize: controlSize, padding: padding, accessibility: accessibility, action: action)
            return borderedButton
            
            
        case .borderedProminantButton(let title, let buttonWidth, let buttonHeight, let font, let fontWidth, let fontWeight, let fontDesign, let buttonBorderShape, let foregroundStyle, let tint, let controlSize, let padding, let accessibility, let action):
            
            let borderedProminantButton = SwiftUIButton.buttonBuilder(buttonType: .borderedProminantButton, title: title, buttonWidth: buttonWidth, buttonHeight: buttonHeight, font: font, fontWidth: fontWidth, fontWeight: fontWeight, fontDesign: fontDesign, buttonStyle: BorderedProminentButtonStyle.borderedProminent, buttonBorderShape: buttonBorderShape, foregroundStyle: foregroundStyle, tint: tint, controlSize: controlSize, padding: padding, accessibility: accessibility, action: action)
            return borderedProminantButton
            
            
        case .borderlessButton(let title, let buttonWidth, let buttonHeight, let font, let fontWidth, let fontWeight, let fontDesign, let buttonBorderShape, let foregroundStyle, let tint, let controlSize, let padding, let accessibility, let action):
            
            let borderlessButton = SwiftUIButton.buttonBuilder(buttonType: .borderlessButton, title: title, buttonWidth: buttonWidth, buttonHeight: buttonHeight, font: font, fontWidth: fontWidth, fontWeight: fontWeight, fontDesign: fontDesign, buttonStyle: BorderlessButtonStyle.borderless, buttonBorderShape: buttonBorderShape, foregroundStyle: foregroundStyle, tint: tint, controlSize: controlSize, padding: padding, accessibility: accessibility, action: action)
            return borderlessButton
            
        case .imageButton(let imageName, let buttonWidth, let buttonHeight, let buttonStyle, let buttonBorderShape, let foregroundStyle, let padding, let accessibility, action: let action):
            
            let imageButton = SwiftUIButton.buttonBuilder(buttonType: .imageButton, imageName: imageName, buttonWidth: buttonWidth, buttonHeight: buttonHeight, buttonStyle: buttonStyle, buttonBorderShape: buttonBorderShape, foregroundStyle: foregroundStyle, padding: padding, accessibility: accessibility, action: action)
            return imageButton
            
        case .iconTextButton(let imageName, let title, let buttonWidth, let buttonHeight, let font, let fontWidth, let fontWeight, let fontDesign, let buttonStyle, let buttonBorderShape, let foregroundStyle, let padding, let accessibility, action: let action):
            
            let iconTextButton = SwiftUIButton.buttonBuilder(buttonType: .iconTextButton, imageName: imageName, title: title, buttonWidth: buttonWidth, buttonHeight: buttonHeight, font: font, fontWidth: fontWidth, fontWeight: fontWeight, fontDesign: fontDesign, buttonStyle: buttonStyle, buttonBorderShape: buttonBorderShape, foregroundStyle: foregroundStyle, padding: padding, accessibility: accessibility, action: action)
            return iconTextButton
            
        case .textIconButton(let imageName, let title, let buttonWidth, let buttonHeight, let font, let fontWidth, let fontWeight, let fontDesign, let buttonStyle, let buttonBorderShape, let foregroundStyle, let padding, let accessibility, let action):
            
            let textIconButton = SwiftUIButton.buttonBuilder(buttonType: .textIconButton, imageName: imageName, title: title, buttonWidth: buttonWidth, buttonHeight: buttonHeight, font: font, fontWidth: fontWidth, fontWeight: fontWeight, fontDesign: fontDesign, buttonStyle: buttonStyle, buttonBorderShape: buttonBorderShape, foregroundStyle: foregroundStyle, padding: padding, accessibility: accessibility, action: action)
            return textIconButton
            
        
        case .iconButton(let iconName, let buttonWidth, let buttonHeight, let buttonStyle, let buttonBorderShape, let foregroundStyle, let padding, let accessibility, action: let action):
        
            let iconButton = SwiftUIButton.buttonBuilder(buttonType: .iconButton, imageName: iconName, buttonWidth: buttonWidth, buttonHeight: buttonHeight, buttonStyle: buttonStyle, buttonBorderShape: buttonBorderShape, foregroundStyle: foregroundStyle, padding: padding, accessibility: accessibility, action: action)
            return iconButton
            
        case .destructiveButton(let title, let buttonWidth, let buttonHeight, let font, let fontWidth, let fontWeight, let fontDesign, let buttonStyle, let buttonBorderShape, let tint, let controlSize, let padding, let accessibility, let action):
            
            let destructiveButton = SwiftUIButton.buttonBuilder(buttonType: .destructiveButton, title: title, buttonWidth: buttonWidth, buttonHeight: buttonHeight, font: font, fontWidth: fontWidth, fontWeight: fontWeight, fontDesign: fontDesign, buttonStyle: buttonStyle, buttonBorderShape: buttonBorderShape, foregroundStyle: Color.red, tint: tint, controlSize: controlSize, padding: padding, accessibility: accessibility, action: action)
            return destructiveButton
            
        case .cancelButton(let title, let buttonWidth, let buttonHeight, let font, let fontWidth, let fontWeight, let fontDesign, let buttonStyle, let buttonBorderShape, let tint, let controlSize, let padding, let accessibility, let action):
            
            let cancelButton = SwiftUIButton.buttonBuilder(buttonType: .cancelButton, title: title, buttonWidth: buttonWidth, buttonHeight: buttonHeight, font: font, fontWidth: fontWidth, fontWeight: fontWeight, fontDesign: fontDesign, buttonStyle: buttonStyle, buttonBorderShape: buttonBorderShape, foregroundStyle: Color.blue, tint: tint, controlSize: controlSize, padding: padding, accessibility: accessibility, action: action)
            return cancelButton
        }
    }
}

extension View {
    /// Applies the modifier to the view conditionally.
    ///
    /// - Parameters:
    ///   - condition: The condition to determine if the content should be applied to the View.
    ///   - content: The modifier to apply to the view.
    /// - Returns: The modified view.
    
    @ViewBuilder func modifier<T: View>(
        if condition: @autoclosure () -> Bool,
        then content: (Self) -> T
    ) -> some View {
        if condition() {
            content(self)
        } else {
            self
        }
    }
    
    /// Applies the modifier to the view conditionally.
    ///
    /// - Parameters:
    ///   - condition: The condition to determine the content to be applied to the View.
    ///   - trueContent: The modifier to apply to the view if the condition passes.
    ///   - falseContent: The modifier to apply to the view if the condition fails.
    /// - Returns: The modified view.
    
    @ViewBuilder func modifier<TrueContent: View, FalseContent: View>(
        if condition: @autoclosure () -> Bool,
        then trueContent: (Self) -> TrueContent,
        else falseContent: (Self) -> FalseContent
    ) -> some View {
        if condition() {
            trueContent(self)
        } else {
            falseContent(self)
        }
    }
}

#Preview {
    SwiftUIButton() as! any View
}
