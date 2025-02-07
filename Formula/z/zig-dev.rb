class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "28f2bb287ee3faf1e1848a4439c9d932c883cd1f76013d13ae72292f9cd0bd72" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "b2a27341adf6f4a57694b0219aaf9cff73cf6ef3aabb4fffaccb8d84a87d9657" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "2ce6dbe25c40c9ea684f80edf99621d4bea48ac12040ae9032cacae6495e32e8" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.3062+ff551374a.tar.xz"
  version "0.14.0-dev.3062+ff551374a"
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
