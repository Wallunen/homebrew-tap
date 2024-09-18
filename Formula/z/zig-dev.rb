class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "192ed69626bddeb25b3e3eab5ea0719c3ee1a0fde8626b5bc296e42088e79dec" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "ce6b7a34bff957f4563e23d0be7cf88fafaf49de10c20e0e77aecc0bde445d39" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "ebd63807e34bfc12ea5eb3a4ec93b7ba95e79e874189c9a65463907742713dfb" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1583+812557bfd.tar.xz"
  version "0.14.0-dev.1583+812557bfd"
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
