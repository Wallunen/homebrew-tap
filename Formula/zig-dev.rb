class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "42031fbb06bd1e35985423102e2a4b1e7a907b74df685d7a619a3a2b54c29782" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "30b3769383eab72bd8d768ed05a487c019962f326d144dfb9e0a1c52c63ffa95" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "8e9546a4fd04b445344191872878255a126590b48d5a8ec5f3891aa497acffec" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.91+a154d8da8.tar.xz"
  version "0.14.0-dev.91+a154d8da8"
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
