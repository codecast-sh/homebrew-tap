class Codecast < Formula
  desc "See, steer, and remember every coding agent session"
  homepage "https://codecast.sh"
  version "1.1.105"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.105/codecast-darwin-arm64"
      sha256 "77690b3d4686ca45959c3b96c738e3da6b79c23e11c440e070966d562dac2d70"
    else
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.105/codecast-darwin-x64"
      sha256 "43340759ac0d5862f596bb87d8c51ea7b8940e8cf3e51b82a0cfc364e263ab96"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.105/codecast-linux-arm64"
      sha256 "92eff0f2fe1462375089e460b9932a6bab81394477e4727ce426843507c538ad"
    else
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.105/codecast-linux-x64"
      sha256 "80153e81bc938c508f47f7c31ce7720dfbf27149999513e18449236e2359fb44"
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
