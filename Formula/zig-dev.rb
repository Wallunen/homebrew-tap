class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "b3994f82ae66cc388c379b0b7e876f36c491535c4cdb0d83d70927f6265cd747" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "333ecf045e2408eb481015ca64e0ce6232b45a5966f9023a0f01027e1ec74b28" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "37086e73f8b9d2b345c1a49a4100d87c7732296ef28a65421e0be9628121db11" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3594+355cceebc.tar.xz"
  version "0.12.0-dev.3594+355cceebc"
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
