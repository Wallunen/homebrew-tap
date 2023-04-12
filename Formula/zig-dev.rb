class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "8847b476b5bde69d68ea46cbbb163a4ebbf848156c1d8731ae3e1d75ba89f80f" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "abd9f47a6d6fb43859d88b9779d2b8e78b2f67ad3126f87cf1bacf0521849768" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "fcdea16a08884b74807e320d63174d59a9c71330c050654fd823f1f3d0ddc707" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2546+cb54e9a3c.tar.xz"
  version "0.11.0-dev.2546+cb54e9a3c"
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
