class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "af6f8425a38d00d6643af1a1e588dc58c0bff264eac9b020d950a22a1082a063" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "92b141be8843f9f0d17db9c2af2b1d92450f1677d7177fe47040aec6e02568a1" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "0c70853bebf21eba29821ea41d55159ce104afc387c6a7a769d91599e6e26e0c" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3193+4ba4f94c9.tar.xz"
  version "0.12.0-dev.3193+4ba4f94c9"
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
