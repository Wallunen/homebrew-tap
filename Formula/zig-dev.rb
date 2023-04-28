class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "b0032fa6967d4fd289e29a85affd4c9cda326ec15f73a46b429393fb9f4960e0" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "73d83dd518c252f03ca1d626ed8dfa86fe1e013cf44b1e5b92ac2c043eea323b" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "bbf4f33f030a32d8039775a27cfb7a559fe0c3975395d30a6afb2fb522d8e8b3" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2868+1a455b2dd.tar.xz"
  version "0.11.0-dev.2868+1a455b2dd"
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
