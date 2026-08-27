class Codecast < Formula
  desc "See, steer, and remember every coding agent session"
  homepage "https://codecast.sh"
  version "1.1.111"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.111/codecast-darwin-arm64"
      sha256 "990e6e02f33a22b478bb8336806c57ab0548b746010b0ebfd53da3220c01b676"
    else
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.111/codecast-darwin-x64"
      sha256 "24aef0cac330e82564bf225d9f2d497802eb6028200648a2714c7958c706822d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.111/codecast-linux-arm64"
      sha256 "67201f6563b7e2ee3d156545324772f70df81586c5a3a31c5f8fb463f1530aad"
    else
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.111/codecast-linux-x64"
      sha256 "b4ff7bf65f2431d1207510e4dbe3b147615f9f7ad806b32817b0a59a81c1aaa6"
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
