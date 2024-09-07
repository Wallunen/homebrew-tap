class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "7cbbf60ea9664f52ff07cac0d0f4cbcd668c586c7c3796850524d2cb41b012d6" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "80f3dc64e4b8eceb93b4d7c2478dc3ad591c74825324d0efacca470208279354" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "157d1e641d923744301b3864b412fa5eac23f63fa3ac0c5f1fd6d627b09fd529" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1480+1511a4171.tar.xz"
  version "0.14.0-dev.1480+1511a4171"
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
