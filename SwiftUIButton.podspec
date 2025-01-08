Pod::Spec.new do |spec|
  spec.name         = "SwiftUIButton"
  spec.version      = "0.0.1"
  spec.summary      = "The SwiftUIButton will create different types of SwiftUI button by providing the necessary parameters."
  spec.description  = <<-DESC
The SwiftUIButton framework will simplify the creation of SwiftUI buttons through a single method call by providing the necessary parameters.
                   DESC

  spec.homepage     = "https://github.com/nkwadgire/SwiftUIButton"
  spec.license = { :type => "Apache 2.0", :file => "LICENSE" }
  spec.author             = { "Nagraj Wadgire" => "nkwadgire@gmail.com" }
  spec.source       = { :git => "https://github.com/nkwadgire/SwiftUIButton.git", :tag => "#{spec.version}" }
  spec.ios.deployment_target = '13.0'
  spec.swift_version = '5.0'
  spec.platform = :ios, '16.1'
  spec.source_files  = 'Sources/SwiftUIButton/**/*.{swift}'
end
