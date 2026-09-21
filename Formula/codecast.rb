class Codecast < Formula
  desc "See, steer, and remember every coding agent session"
  homepage "https://codecast.sh"
  version "1.1.151"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.151/codecast-darwin-arm64"
      sha256 "b6a64689562db9bff6149d61ba5be4c76ac5337072e80b23278632fb553f956a"
    else
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.151/codecast-darwin-x64"
      sha256 "f8216031123512ea40d1de665ef0d4f3f9b69eaffbccc62ddb7acd0ba10f814b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.151/codecast-linux-arm64"
      sha256 "4e598150aae4e5024edca626a42ca23c753b0981fe244ad310f06e1c7000c841"
    else
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.151/codecast-linux-x64"
      sha256 "e4e94193c3b61c9be98b2ce1a7790eaa35b67dcef17262fd42dc6c24ca50af47"
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
