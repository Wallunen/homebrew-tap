class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "64b2e86ba8087fb4b553ae3a0497e7d14d587e65edc3af55b2460fb878be59ac" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "20f99e806dc825bd87d97f5cc31419ff6ffcc07b1436159039d9bc8dd3335c06" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "b82a3499b456c6a6a410a79b87ef1b09a29b1a747e711372055232cffb2e4269" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3258+7621e5693.tar.xz"
  version "0.11.0-dev.3258+7621e5693"
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
