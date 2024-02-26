class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "8455e2417cdeb83b9ed3f9aa93f455812b2be8567cf629f35bea743fe0baa63d" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e16637153714b67db21a2beb794a8965b407c4d16fd223ccb918034899cabb22" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "19d9edab64695b5d9de77c3efcabf9a684b56facc044f721c41027f7710eadd2" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2999+6c2eb0f13.tar.xz"
  version "0.12.0-dev.2999+6c2eb0f13"
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
