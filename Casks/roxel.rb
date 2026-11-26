cask "roxel" do
  version "1.5.0"
  sha256 "6d53ffbaec2334b3e96f9c88e72547d6d069d01fbd17560c834990da814fe532"

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
