class Codecast < Formula
  desc "See, steer, and remember every coding agent session"
  homepage "https://codecast.sh"
  version "1.1.129"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.129/codecast-darwin-arm64"
      sha256 "69a998acab683c9d67599341c9f2d502b056d4cf570ee2243ca5dfd530feb666"
    else
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.129/codecast-darwin-x64"
      sha256 "1cb6172db609feac0853245989e4ff5c9414d949a69088c690951dfc0527820a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.129/codecast-linux-arm64"
      sha256 "008b12b2a882e2ed82bbc39b9e24255ccfa87362f1dcb911956b76fbec654518"
    else
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.129/codecast-linux-x64"
      sha256 "f4d02fbdfa5d13d10c03dc0e4be1a1c6b3770585bf1fe4e6f3d3ba6c0b7e720c"
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
