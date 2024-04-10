class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "b13ecdcb4d5efb552e1f5ccfedf1e3958dc6feb9f3084cf70a7b3a18a348a94f" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "9a002377d9873e8a042b988d995e756d980571903acfa7d99e018555fb22428a" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "a35d80e87591c5207bfb9f684fae5f708699630516ce5c940e27852a4aeeafe9" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3610+9d27f34d0.tar.xz"
  version "0.12.0-dev.3610+9d27f34d0"
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
