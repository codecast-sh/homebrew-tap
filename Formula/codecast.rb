class Codecast < Formula
  desc "See, steer, and remember every coding agent session"
  homepage "https://codecast.sh"
  version "1.1.109"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.109/codecast-darwin-arm64"
      sha256 "4450b02c858f845affdacfadb74600f0660511586e9bf060a59c992d8074644b"
    else
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.109/codecast-darwin-x64"
      sha256 "5b148f10dd4cbbcef2db6a250e1f9c5e22811f7b3f07796a37c056008d843dc2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.109/codecast-linux-arm64"
      sha256 "1ab3712d8a87ed2741af582bebb0318af4d09d46c03e02ca2673473635fd349c"
    else
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.109/codecast-linux-x64"
      sha256 "3d949929d36203e8d508fe3d9d72ba13a9e923345b632eece4c0518469c4c2bb"
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
