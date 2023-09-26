class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "a8fc239ea60a51ae99750da3174cef656da2c22ce12b4c3177ae612240554017" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "691b2193ae819ee8896bb0113610f8b997772d62a50747190bd76a8d9edd7653" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "0d768553dbcbb12f2ed3bc7bab8cbceca53622b2a3b19acd6436319972a9b885" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.587+eb072fa52.tar.xz"
  version "0.12.0-dev.587+eb072fa52"
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
