class Codecast < Formula
  desc "See, steer, and remember every coding agent session"
  homepage "https://codecast.sh"
  version "1.1.110"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.110/codecast-darwin-arm64"
      sha256 "d81400779fc6acd98eb3f5bb6635eeafa518c2ec57578fce1e31fe7e0b540f99"
    else
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.110/codecast-darwin-x64"
      sha256 "39c8c8c06fed40684e1e807f3af480d2b74624002bdef2deefcf61596ae2d3e6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.110/codecast-linux-arm64"
      sha256 "3077487c484ce99821e5d8d37214a813b1b903179dfc2c31bc55cfe21f27554a"
    else
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.110/codecast-linux-x64"
      sha256 "bd142d421f1bd3361c03cc147baca1b0b7342abfe2cc06aa1f00defea551a30e"
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
