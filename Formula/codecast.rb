class Codecast < Formula
  desc "See, steer, and remember every coding agent session"
  homepage "https://codecast.sh"
  version "1.1.150"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.150/codecast-darwin-arm64"
      sha256 "07dad312841bd2398e148d082d5bc5d71ab6d3c526d79f89d378e3e9f71fabf1"
    else
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.150/codecast-darwin-x64"
      sha256 "c2d378a8316b4acb0cdb85ca3089b742c6cc14b9bad588224c012cf106bdb9f9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.150/codecast-linux-arm64"
      sha256 "9cb74ff700e1c9f663a8aee76966808058a42002ad25648ca1eeb7e83725f915"
    else
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.150/codecast-linux-x64"
      sha256 "167273ccd85569a3700a062b61507a37b5f27dce24614f1d67a92df6c99720f4"
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
