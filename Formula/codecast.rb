class Codecast < Formula
  desc "See, steer, and remember every coding agent session"
  homepage "https://codecast.sh"
  version "1.1.112"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.112/codecast-darwin-arm64"
      sha256 "92026859b51f64bec6d4ad538d5d82d1dc79a688143b147269295ce7e04ea5d1"
    else
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.112/codecast-darwin-x64"
      sha256 "676650f6223a8441c1fdb39a5117d3ce365a831dbbf5b98351b1693c4a65985e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.112/codecast-linux-arm64"
      sha256 "2a988afa39812b5fe74e384d3ee6b12513cd7bf082728823fad26235dab1f17c"
    else
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.112/codecast-linux-x64"
      sha256 "fa27c453c994b2123ed0cbdcb1183eac91cb21094fb994d3b4789a9d9d029a8b"
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
