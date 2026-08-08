class Codecast < Formula
  desc "See, steer, and remember every coding agent session"
  homepage "https://codecast.sh"
  version "1.1.100"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.100/codecast-darwin-arm64"
      sha256 "65f7f826fe6116c330cbf60c1d74f88586883407f775eceb3e0e47f2c4011f32"
    else
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.100/codecast-darwin-x64"
      sha256 "a0b2badd951f4636e7ea4a91343a6ac344422050fd614f6e12bdaed5d7469538"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.100/codecast-linux-arm64"
      sha256 "3c8ce1540e29268771b4b367ab18d66931c6de7fc4ee62ff21337de42fd6c3c7"
    else
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.100/codecast-linux-x64"
      sha256 "73d329911dbc232a2ac949d317b52f115874c51316e96be7341f0394c2b440b1"
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
