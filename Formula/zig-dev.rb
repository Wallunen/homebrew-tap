class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "39c20419d0afd5887552ac680e9b5911101387a1d8dc8370edb22ae18ae68457" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "4a8895ee1531b80b688240f9397a15117dabf0aaa645c308bc851f097924c6e7" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "dc61fe21bd88dbe10a6dccae04d6edd40b51bfd151a00a2dc239e79337d843ce" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2666+1e207f1ed.tar.xz"
  version "0.11.0-dev.2666+1e207f1ed"
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
