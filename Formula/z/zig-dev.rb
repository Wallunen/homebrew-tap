class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "d4d4bb737d46e0386d339a69411532975714fbe769d0dff6d184328603dce12e" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "df5fd8e5ad06f1b9001f3bfd33759818d89605fa32d77e16308ae9e61a68de13" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "abaabc682b622ba9018d3048d631d4f71a1f92692e00adf48b13de2a09f3fcc0" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2270+a5d4ad17b.tar.xz"
  version "0.14.0-dev.2270+a5d4ad17b"
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
