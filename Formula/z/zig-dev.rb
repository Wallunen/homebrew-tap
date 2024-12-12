class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "3932c518ed2e80d10981d98fc4009d97e04f94100a7f9853fce6eaba50c37b91" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "6d2dd8b6da17a65a61c19c0974ee896752a0a04bd75aedfecc4b36fa1b015665" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "a4d243f3f56a54f7c9283d80ade270cc54f8c300ee5d7c1b4670b88f9e67b51c" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2441+3670910f2.tar.xz"
  version "0.14.0-dev.2441+3670910f2"
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
