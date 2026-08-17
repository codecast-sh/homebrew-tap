class Codecast < Formula
  desc "See, steer, and remember every coding agent session"
  homepage "https://codecast.sh"
  version "1.1.107"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.107/codecast-darwin-arm64"
      sha256 "597548c072e7544e22e0b585aeebd141324f930f2e98635df550dba39862e8eb"
    else
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.107/codecast-darwin-x64"
      sha256 "9b73258c807eef15da17fd88815d8f915587a62c40c4e247def108bc04b0514e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.107/codecast-linux-arm64"
      sha256 "cbe8702a7574877379b69e070c7d423433baac26dd54c8e971b0fc94589f1ef0"
    else
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.107/codecast-linux-x64"
      sha256 "66b1ab0ebd07bd1b4f2e48aa3502e4ef659d007f535bd13146f85e3dd8185163"
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
