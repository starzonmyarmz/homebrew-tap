cask "arturia-midi-control-center" do
  version "1.23.0.134"
  sha256 "7e1397cf287248e389f59ef0ee76164d4dcd791edeb6f53086a91ebad1ba66cb"

  url "https://dl.arturia.net/products/mccu/soft/MIDI_Control_Center__#{version.dots_to_underscores}.pkg"
  name "Arturia MIDI Control Center"
  desc "Firmware updater and editor for Arturia MIDI controllers"
  homepage "https://www.arturia.com/technology/mcc"

  livecheck do
    url :homepage
    regex(/MIDI[._-]Control[._-]Center[._-]+v?(\d+(?:[._]\d+)+)\.pkg/i)
    strategy :page_match do |page, regex|
      page.scan(regex).map { |match| match[0].tr("_", ".") }
    end
  end

  depends_on :macos

  pkg "MIDI_Control_Center__#{version.dots_to_underscores}.pkg"

  uninstall pkgutil: [
    "com.Arturia.MIDIControlCenter.resources",
    "com.Arturia.MIDIControlCenter.templates",
  ]

  zap delete: "/Library/Arturia/MIDI Control Center",
      trash:  "~/Library/Caches/com.juce.locks/juceAppLock_MIDI Control Center",
      rmdir:  "/Library/Arturia"
end
