class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "99199eea8d1e0783f04d14a310cab0b372a1fb4b44aec88fdc02cbfe77d06a6d" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e1e57256f7d60c538c9a1abbdf156fbd0d2dedb7f8be94c6fe606537c925c0ef" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "fe8e33b4543ecf10f6d28ceb6d8d3eef69551fbd70222b5a5c7c9d99f983f452" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3132+465272921.tar.xz"
  version "0.11.0-dev.3132+465272921"
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
