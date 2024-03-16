class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "1f3ba618fb7152529a2fd8630f3bd4659ad47705a1c074b6d48fea485dfc9763" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "58f99d3d5c71038ffd14028934ea92766e16953fde4c1ba45b9c9905a7a87bab" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "3929b273ad2bf7bac7135c35f74d05c5a4746034579d68618691dc128eb4140b" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3328+5cd7fef17.tar.xz"
  version "0.12.0-dev.3328+5cd7fef17"
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
