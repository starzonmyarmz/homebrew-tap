cask "hogs" do
  version "0.1.0"
  sha256 "8e3346e89b20382196ab951e8655f4dcf28c2c879355eb1e0392008747ff34d6"

  url "https://github.com/starzonmyarmz/hogs/releases/download/v#{version}/Hogs-#{version}.zip"
  name "Hogs"
  desc "Menu bar app that flags processes hogging the CPU"
  homepage "https://github.com/starzonmyarmz/hogs"

  depends_on arch: :arm64
  depends_on macos: ">= :sonoma"

  app "Hogs.app"

  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Hogs.app"]
  end

  uninstall quit: "com.iamdanielmarino.hogs"

  zap trash: "~/Library/Preferences/com.iamdanielmarino.hogs.plist"
end
