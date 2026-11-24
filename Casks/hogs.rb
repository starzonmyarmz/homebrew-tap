cask "hogs" do
  version "0.3.2"
  sha256 "8d3f8f362882c3849303c1524d47e8293e76b588fcfd919fdb923e4eaab3bc96"

  url "https://github.com/starzonmyarmz/hogs/releases/download/v#{version}/hogs-#{version}.zip"
  name "Hogs"
  desc "Menu bar app that flags processes hogging the CPU"
  homepage "https://github.com/starzonmyarmz/hogs"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Hogs.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/Hogs.app"],
        writable_paths: ["Hogs.app"],
        writable_base:  :appdir
  end

  uninstall quit: "com.iamdanielmarino.hogs"

  zap trash: "~/Library/Preferences/com.iamdanielmarino.hogs.plist"
end
