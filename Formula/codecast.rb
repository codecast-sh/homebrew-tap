class Codecast < Formula
  desc "See, steer, and remember every coding agent session"
  homepage "https://codecast.sh"
  version "1.1.118"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.118/codecast-darwin-arm64"
      sha256 "bb891f1943fd35b541f0537ee2fda1ebb42df94b84cb68d888c5385a9b4b3567"
    else
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.118/codecast-darwin-x64"
      sha256 "234c09262cf073e964e66d3fa1b114cc28fd13410db1031227a2b1dcd22457f9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.118/codecast-linux-arm64"
      sha256 "1a3d1d4b87f1d9bb4660cddba61df8a3dc3865963bc3a2fdb4526f21b096d92f"
    else
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.118/codecast-linux-x64"
      sha256 "92aa0c5340db10a6a8da1b698f9a4d17a839806bf8e502dd0417d21b238da06e"
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
