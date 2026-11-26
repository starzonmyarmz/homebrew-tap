class Rox < Formula
  desc "Command-line companion to the Roxel voxel editor"
  homepage "https://github.com/starzonmyarmz/roxel"
  license "MIT"

  on_macos do
    url "https://github.com/starzonmyarmz/roxel/releases/download/v1.5.0/rox-macos.zip"
    sha256 "0f02eed662bb5cf3a5ef931bb40cca1b76dc7094a0e62543d2438df30af2d53c"
  end

  on_linux do
    on_intel do
      url "https://github.com/starzonmyarmz/roxel/releases/download/v1.5.0/rox-linux.tar.gz"
      sha256 "236640e69993166ffa12efa33f50fa6ef29deab185d8dd8b66d46fc027b30d54"
    end
  end

  def install
    bin.install "rox"
  end

  test do
    assert_equal "rox #{version}", shell_output("#{bin}/rox --version").strip
  end
end
