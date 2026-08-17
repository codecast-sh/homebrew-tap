class Codecast < Formula
  desc "See, steer, and remember every coding agent session"
  homepage "https://codecast.sh"
  version "1.1.108"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.108/codecast-darwin-arm64"
      sha256 "588bb55c4da07bbb66877cdf7f43b5c39521c9a38fd68f193b7c56b52a2b0886"
    else
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.108/codecast-darwin-x64"
      sha256 "4459249c60df77bfa61bec9997428e2533317c5489cf2ff9838dceacfc095e07"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.108/codecast-linux-arm64"
      sha256 "45d922b19669e48dc18b0db1f891266fc2bd887debb7da75bbfeda73deb5d1e2"
    else
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.108/codecast-linux-x64"
      sha256 "dfb6506cff85f1eb0c12cb72c9ac832d0e733e71d9c1332ff2aa6e5cab0ba96c"
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
