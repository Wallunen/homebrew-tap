class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "c857aafe063ad6845cdcb6e12bc357778d680919bd0bbc59f1bc6dc64cb2aead" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "0f3f57c14f87c94d8cc987a69e3a47d9758a05cff1c14d103a5f3fce26874a02" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "13f173626074251389865432ca425a17e689379e7d0506306c1f52b14b7a2744" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2541+894493549.tar.xz"
  version "0.12.0-dev.2541+894493549"
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
