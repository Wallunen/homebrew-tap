class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "24975007610264c958480314d7e2919590a742d189b39877a46178a43872a332" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "68e93843b04786946afa922218b200af963828d08719f9dd1223fc99529109ec" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "76a5c00746e573296177fee2546bee83b15e703c208a5fc0e0bc6078b8ca933d" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2991+9f3f9fb40.tar.xz"
  version "0.11.0-dev.2991+9f3f9fb40"
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
