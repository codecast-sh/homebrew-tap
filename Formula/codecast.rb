class Codecast < Formula
  desc "See, steer, and remember every coding agent session"
  homepage "https://codecast.sh"
  version "1.1.127"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.127/codecast-darwin-arm64"
      sha256 "28937d5cd0df694611f3db4d8a1a7af7e08bce8820e256eccb102064480e4688"
    else
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.127/codecast-darwin-x64"
      sha256 "b5e8f33598dd6a60bf94a37b799a28c8f56c606841f7192234cc6b2c8b2ef6f6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.127/codecast-linux-arm64"
      sha256 "55e12ac09f8c781d69fb4da3e5418009bc8ee0994049c798bcf047b5c0b45a07"
    else
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.127/codecast-linux-x64"
      sha256 "ccfb923db81374786c227deb732d256da25250ba14bcb80850a67ce52143851e"
    end
  end

  def install
    binary = Dir["codecast-*"].first
    bin.install binary => "codecast"
    chmod 0755, bin/"codecast"
    bin.install_symlink "codecast" => "cast"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/codecast --version").strip
  end
end
