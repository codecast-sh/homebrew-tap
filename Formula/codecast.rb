class Codecast < Formula
  desc "See, steer, and remember every coding agent session"
  homepage "https://codecast.sh"
  version "1.1.102"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.102/codecast-darwin-arm64"
      sha256 "146959927f2cb5c7b5bf2f1ff61a9e8f7647e72572fa4987d9737eb22e17e798"
    else
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.102/codecast-darwin-x64"
      sha256 "6f0ebe12e5edaf8db6a414bdbabaa557bf985248daaca20d216842248dc41e37"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.102/codecast-linux-arm64"
      sha256 "9ec9c46281c89ed339791e89897e8b9e12589a0f628b8ca802cb71f12a64bf31"
    else
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.102/codecast-linux-x64"
      sha256 "3acd81e9d3ba7f7830129e445b48dac7893d1d2999ee9c98af486d151250ebc8"
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
