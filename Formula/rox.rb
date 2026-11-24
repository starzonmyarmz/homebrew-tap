class Rox < Formula
  desc "Command-line companion to the Roxel voxel editor"
  homepage "https://github.com/starzonmyarmz/roxel"
  license "MIT"

  on_macos do
    url "https://github.com/starzonmyarmz/roxel/releases/download/v1.4.0/rox-macos.zip"
    sha256 "bff6ba8d5fa065be9cbd69b54b33b8affc97f3647a916a55c26bfcc9553a2e1b"
  end

  on_linux do
    on_intel do
      url "https://github.com/starzonmyarmz/roxel/releases/download/v1.4.0/rox-linux.tar.gz"
      sha256 "8760be54080d4df1646f53d3c9f5e828c1eb9568366f1c1a4ac0ca0739762972"
    end
  end

  def install
    bin.install "rox"
  end

  test do
    assert_equal "rox #{version}", shell_output("#{bin}/rox --version").strip
  end
end
