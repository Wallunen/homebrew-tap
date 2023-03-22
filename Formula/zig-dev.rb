class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "c81506bc91b2743e583adaebba53b0d6be5b0cc9af84bd1bde47e02100f13438" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "4ac64c17fe61dbbcd7d0850df6255eaa6718ea5199d23e279661f2db8f3a1461" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "8cff488c2427c6f09efb6b7e3493e5ca3d7e136d53c9046fe1ecf6468c5044f5" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2227+f9b582950.tar.xz"
  version "0.11.0-dev.2227+f9b582950"
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
