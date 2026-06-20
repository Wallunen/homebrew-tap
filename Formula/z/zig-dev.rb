class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260620-102838"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "11583494224ee48532b672c4db56e2adb49ad644a95bee320acf89f86bbfa0a3"
    sha256 cellar: :any_skip_relocation, sequoia:      "eb5c27ff6478205f044f6915fb696fdf0f110616cc34a58da4ed601ea205ee2b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "cc64dac5c6fdbab8f8958fea386fd04059a16885a67c5f061330695848f73e13"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "94fa4db35a2d746b302620435f99d057fa972ad78010656d4157160dbd36c7aa" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "c68c6d29c7ba6273705c40de7f68c058c9c943c85892cb028a3fc4fdc41e6970" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "6f31ed18c8dc7da5995e54a2d39a50159b810e8c23ab9bcdb04be29230a5d25a" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.902+7255f3e72.tar.xz"
  version "0.17.0-dev.902+7255f3e72"
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
