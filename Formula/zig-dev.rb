class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "bf69af8ac2dc09a2764d6753acfefddcd226f64c2802efe55d3f60f1f9cf1775" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "1f01d96be805418b1a126d5a4b001d7254db78f4f0056bcda056a10957b8ea7b" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "d445e198486151915f92f7d76b3a181aeb52d20556729eaa8dbc305762e501fd" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3322+82632aff2.tar.xz"
  version "0.11.0-dev.3322+82632aff2"
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
