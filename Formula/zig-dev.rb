class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "5fb3ea5ee206ac27234edb9445de99e336d1161b150e4cad7b5cd88e6530dcaa" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "b5ec8e219761d3ec1dcefa47352641262ada6d28f36aa179941d9275210b2cf3" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "c8e3bb4be1a8ad1e81f2df8371b55d9067b389f5ffc25373dd0e21aa6fc33692" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3892+0a6cd257b.tar.xz"
  version "0.11.0-dev.3892+0a6cd257b"
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
