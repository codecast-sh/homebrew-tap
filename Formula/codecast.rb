class Codecast < Formula
  desc "See, steer, and remember every coding agent session"
  homepage "https://codecast.sh"
  version "1.1.101"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.101/codecast-darwin-arm64"
      sha256 "19e0fa0333b0e7b35b53adc995ddde87f35df754df4e2b78d8e97b5be12f6790"
    else
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.101/codecast-darwin-x64"
      sha256 "34805674dd2a797cbf8638ce2af54980551a20320580209c7f39dbb7ebbfc218"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.101/codecast-linux-arm64"
      sha256 "6a32023cc255c25bba5c36a387675eebcf9006eefe2751f8a889156204955228"
    else
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.101/codecast-linux-x64"
      sha256 "72e592cb71a0de777675e63d2ababc33da7284ad13b43877ac0edee428a922f6"
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
