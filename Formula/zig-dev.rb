class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "6a85895cc62b7a02f98aca41eb1c36f233ac1dd0881685c1f02aed80efb027fa" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "300c0f5d437c1b8dd90a2ca63b5da152226b6b806b5dbcf9ff957b3144162990" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "7668c82735abbb1bbe51b06aaf4114962983e8eed1a217f03482b2399b54c32a" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.4282+0f21d3d4d.tar.xz"
  version "0.11.0-dev.4282+0f21d3d4d"
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
