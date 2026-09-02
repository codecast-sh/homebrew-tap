class Codecast < Formula
  desc "See, steer, and remember every coding agent session"
  homepage "https://codecast.sh"
  version "1.1.117"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.117/codecast-darwin-arm64"
      sha256 "9ee6abbd530db009f61478d41e188cb1af5cf49e2d426562c51a0d77c304d295"
    else
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.117/codecast-darwin-x64"
      sha256 "7b037f95f4dccbb65c9557c09ef81bf60dd566a2ef6ae5b3b5be8ddc846c8450"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.117/codecast-linux-arm64"
      sha256 "92801e239417f846b8a121a9576c6d523307c350747cd4090bedba9a119fff51"
    else
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.117/codecast-linux-x64"
      sha256 "d8c4265b73971642943f9c2ae7ca8f26447f318aa7ec2a6a91a0fe135cf46ed3"
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
