class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "25805bf32c974c9947c7de4d50019f3e09fcf8aaafcd5eb5cb82a34b4ff01ed5" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "a80384ba5d4d58c5572f6adedce8ffe52ee20ee2fa8bd4e8830e1f46d3247976" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "ef6bfa6cdb95b60ecde74b468f01d79294a5f295e166e635a00adc3bba583f79" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.312+cb6201715.tar.xz"
  version "0.12.0-dev.312+cb6201715"
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
