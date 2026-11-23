class Rox < Formula
  desc "Command-line companion to the Roxel voxel editor"
  homepage "https://github.com/starzonmyarmz/roxel"
  license "MIT"

  on_macos do
    url "https://github.com/starzonmyarmz/roxel/releases/download/v1.3.2/rox-macos.zip"
    sha256 "7d9d5d4058205e33a6951ca2554fe7a51d6016522f54411bbba3d406aa10db89"
  end

  on_linux do
    on_intel do
      url "https://github.com/starzonmyarmz/roxel/releases/download/v1.3.2/rox-linux.tar.gz"
      sha256 "bfc42594d15ff5b90dbdc4a0fbf75eac0ebc38e67e4bfafc17ddf7e59842caad"
    end
  end

  def install
    bin.install "rox"
  end

  test do
    assert_equal "rox #{version}", shell_output("#{bin}/rox --version").strip
  end
end
