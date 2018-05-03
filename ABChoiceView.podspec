Pod::Spec.new do |spec|
spec.name = "ABChoiceView"
spec.version = "1.0.0"
spec.summary = "ABChoiceView "
spec.homepage = "https://github.com/avivbenshabat/ABChoiceView"
spec.license = { type: 'MIT', file: 'LICENSE' }
spec.authors = { "Aviv Ben Shabat" => 'avivbenshabat@gmail.com' }

spec.platform = :ios, "9.1"
spec.swift_version = "4.0"
spec.requires_arc = true
spec.source = { git: "https://github.com/avivbenshabat/ABChoiceView.git", tag: "v#{spec.version}", submodules: true }
spec.source_files = "ABChoiceView/**/*.{h,swift}"

end
