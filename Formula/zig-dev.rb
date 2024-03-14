class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "59a3c875de8411a06eb81d1e386a89145d07311ddee3f05ddc5aeb3af8a423ea" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "2fd71a20edc01789a635501cbffdef86b007d6189d5e3f3f400612918a40c045" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "bb3d6d63dbaaeacf86db4c4936f41805fbb59017050a82d84cf93f317c6a7c8c" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3291+17bad9f88.tar.xz"
  version "0.12.0-dev.3291+17bad9f88"
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
