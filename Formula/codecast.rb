class Codecast < Formula
  desc "See, steer, and remember every coding agent session"
  homepage "https://codecast.sh"
  version "1.1.103"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.103/codecast-darwin-arm64"
      sha256 "a33ae65ff682dc480a064b27e2b9f6500a3734096f79541dbc27bc053864ae54"
    else
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.103/codecast-darwin-x64"
      sha256 "0201449c9c3b4faca7c012180a47fa3ca713510288c9a7f66eac2748c2670ec3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.103/codecast-linux-arm64"
      sha256 "21abcd764cf75be73531eabe9c4e0400ed836bdbbc06e9f6df1cff093aaa2bb2"
    else
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.103/codecast-linux-x64"
      sha256 "189c16f48c259dcfca0782a426f4655ae1bcb399a4d0ccedbded25c6c1d1dccf"
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
