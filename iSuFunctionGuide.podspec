
Pod::Spec.new do |spec|

  spec.name         = "iSuFunctionGuide"
  spec.version      = "0.0.1"
  spec.summary      = "Function of guiding / iOS 功能引导器"

  spec.description  = <<-DESC
                      Function of guiding / iOS 功能引导器
                   DESC

  spec.homepage     = "https://github.com/iSuAbner"

  spec.license      = "MIT"

  spec.platform     = :ios, "8.0"

  spec.author             = { "巴文辉" => "bawenhui@pwrd.com" }

  spec.source       = { :git => "https://github.com/iSuAbner/iSuFunctionGuide.git", :tag => "#{spec.version}" }

  spec.source_files  = "iSuFunctionGuide/**/*.{h,m}"
  spec.exclude_files = "iSuFunctionGuide/iSuFunctionGuide.bundle"

end
