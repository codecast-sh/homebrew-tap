class Codecast < Formula
  desc "See, steer, and remember every coding agent session"
  homepage "https://codecast.sh"
  version "1.1.116"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.116/codecast-darwin-arm64"
      sha256 "692c324fc9eecb15db24721ed9f2fbdfcf5aa512988e777d5a187b639ea9a064"
    else
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.116/codecast-darwin-x64"
      sha256 "864b547ff4e8a5b62bc6a4dc4583be1f9ff777a19725c29a7ea20b9e036a7e5c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.116/codecast-linux-arm64"
      sha256 "04d749b52d35e9aaa553ae40681e2a87624baa1f0a0c957558fa2a01dedf53c6"
    else
      url "https://github.com/codecast-sh/codecast/releases/download/v1.1.116/codecast-linux-x64"
      sha256 "caace0cb3b57323ff205905837bde246e0eddd7461206d07f6705125565a9355"
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
