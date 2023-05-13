class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "ddc77cf2f976807c6600cc5b63f6dea75eb659369588b294c2934954e689d9f6" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "c87167e2b52a4d9742b6d8d64762da955906fae9e3ff1a1d98e90579ec188ecd" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "e03b5f7c7429cc5ef1dc28414a48e25a0cc69083f2cbf8ef25c46f4d1004d9e0" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3105+e46d7a369.tar.xz"
  version "0.11.0-dev.3105+e46d7a369"
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
