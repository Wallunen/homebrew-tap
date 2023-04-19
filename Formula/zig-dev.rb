class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "3247cc5901c659c5a3137cda97658d996f2fa1a2374d8bd4a5984a93eee5772f" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "8cfa7496431615ef2a6805a0355eebae4bca971e0075e2689f96b48348407b86" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "71d9f4e00f454039922c7243d636ff41e678137c47906f159e7927e498dfbd26" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2652+8ba937c78.tar.xz"
  version "0.11.0-dev.2652+8ba937c78"
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
