class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "1ecfb522f95762bf7d3c55a0fd9beef076126b1c20607523337a68ce7c93d0b8" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "41bb5be3f26e27ee401e301ef2fb50907708bee52de807e22cbf80204bd543ed" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "5481a69b6036392d2562a3605309ff65b0bab159929a1f56af40df52fdbe03b3" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1694+3b465ebec.tar.xz"
  version "0.14.0-dev.1694+3b465ebec"
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
