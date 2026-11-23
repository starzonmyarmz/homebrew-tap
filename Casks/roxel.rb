cask "roxel" do
  version "1.3.2"
  sha256 "fae1d37800905712dba732891657b28b2a64ae1675b89c1691f560532896abf9"

  url "https://github.com/starzonmyarmz/roxel/releases/download/v#{version}/Roxel-macos.zip"
  name "Roxel"
  desc "Voxel editor"
  homepage "https://github.com/starzonmyarmz/roxel"

  app "Roxel.app"

  zap trash: "~/Library/Application Support/roxel"

  caveats <<~EOS
    Roxel is self-signed and not notarized, so macOS blocks its first launch.
    Right-click Roxel.app in Applications and choose Open, or run:
      xattr -dr com.apple.quarantine #{appdir}/Roxel.app
  EOS
end
