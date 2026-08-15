class Codecast < Formula
  desc "See, steer, and remember every coding agent session"
  homepage "https://codecast.sh"
  version "1.1.106"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.106/codecast-darwin-arm64"
      sha256 "5bc6c30a87997fb4f95938b292a94eadee201bd3cdc6e41b7713f225d3ddd9f6"
    else
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.106/codecast-darwin-x64"
      sha256 "73b18de9325f059e5b09885148c28ddf47ed174e80052e615a9eedfa6b7ddc88"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.106/codecast-linux-arm64"
      sha256 "0aa022581d4b9d571c3f3469da4eaef89202b8026cea7e606b1a39f59e51bc41"
    else
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.106/codecast-linux-x64"
      sha256 "f0d9c47e35bca0acc137106e09e6f0502b0ada31dcd1651704c57620c4d380ab"
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
