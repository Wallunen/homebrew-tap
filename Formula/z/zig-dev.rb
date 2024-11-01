class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "45c758e9301c1256ab079df9e9517a62c49adb397a18134bf71207c78ce15005" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "147a4dec344e793a1dfdd620d00d3b99b69d28291cdc5d1bfe62f84c999aa6c8" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "1928f2b4d66987f84832ba9fdc7d3ebf238573f436c2772dbacdd39c6dd3deca" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2085+a916bc7fd.tar.xz"
  version "0.14.0-dev.2085+a916bc7fd"
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
