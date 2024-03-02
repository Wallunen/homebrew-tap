class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "327a08ce67adf38c31c540cdb70ec77c4d9026a2cbc9207dbb62807471dd07c4" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "4c3c19eb07087858975bb24b3b7921f4fd50833ff14c260f7bb3ba8d422cf31f" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "8164289b8eacbf9de903bf0f6aa7980f55f408ea0831874ecce30f9854612d8f" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3125+a7a5f4cf4.tar.xz"
  version "0.12.0-dev.3125+a7a5f4cf4"
  license "MIT"

  livecheck do
    skip "Dynamic `url` and `sha256`"
  end

  depends_on macos: :big_sur # https://github.com/ziglang/zig/issues/13313
  depends_on "z3"
  depends_on "zstd"
  uses_from_macos "ncurses"
  uses_from_macos "zlib"

  conflicts_with "zig", because: "both install a `zig` binary"

  def install
    bin.install "zig"
    lib.install "lib" => "zig"
  end
end
