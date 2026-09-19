class Codecast < Formula
  desc "See, steer, and remember every coding agent session"
  homepage "https://codecast.sh"
  version "1.1.143"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.143/codecast-darwin-arm64"
      sha256 "87dcfae67c7573940a66336bbdfe3da3966c005b6b319bd53b5642b5d8169f5c"
    else
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.143/codecast-darwin-x64"
      sha256 "fbc4c40919822d6e7bb43aec030038daee62a2d934925170fdb8e53f1f516c43"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.143/codecast-linux-arm64"
      sha256 "acfd2dbc15dc27777a92771391e12f824c15985b89765be0eb99161c2afe1b0c"
    else
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.143/codecast-linux-x64"
      sha256 "fa9c09b53e2a5b2529776c4f0e23c64d534ed1f795a399835adb845b812ac897"
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
