class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "9c02fe2ae6d987b68d2f9d668faa9e5d663c904a29b56f761b108321433da7e0" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "612a7db10143f42acc2bec40801ebc5feebf3e034c8ba960c85539818d485af7" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "597a61125071b44f2c7cd000002e9973c8de99346faca7c6f259e17768ba1e31" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2182+54d0ba418.tar.xz"
  version "0.14.0-dev.2182+54d0ba418"
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
