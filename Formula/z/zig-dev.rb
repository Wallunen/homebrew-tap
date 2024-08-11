class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "683907427632f79c40221de2b532a37dcc91cc0f3f2bf4a552e0ee3f8c053670" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "d9a0a7c588985845d35ed2e8632b812bf1dcc1bea31593cfffa8a172f0de637e" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "b155e5f0aa94460a465be66411066f86a9ec53e1f132e466633078b2f0410ca0" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1012+b7c01120b.tar.xz"
  version "0.14.0-dev.1012+b7c01120b"
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
