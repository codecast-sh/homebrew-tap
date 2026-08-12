class Codecast < Formula
  desc "See, steer, and remember every coding agent session"
  homepage "https://codecast.sh"
  version "1.1.104"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.104/codecast-darwin-arm64"
      sha256 "7d8f285c7bae1b06f332f52a819824995211ec7c21d1e89e33e971313e3a130f"
    else
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.104/codecast-darwin-x64"
      sha256 "eb5da4227a6d67b84f080595973220cee3918e0143175ecd5ddcc7f3798aac2b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.104/codecast-linux-arm64"
      sha256 "0e44d9eca77c21ebcf26d7ab176714faabc24ca48eb0e535320da331a2dd6cf7"
    else
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.104/codecast-linux-x64"
      sha256 "6815114e4a362e23d7dd5e864a27637fd7edad73904abf2eeb4c35d747fc1f12"
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
