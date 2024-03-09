class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "761f28628d0cff2b9f045d501beb4856e118f442b89be04b0e26c56cf11b82f8" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "efdf7ab25239a633aaa03a877038ea4f727497502d96458a38ad56de3f52de87" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "966aacf5d1051f96eb69f9b92b4828ddc2d6646fe97531530ed9059318bf52bb" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3191+9cf28d1e9.tar.xz"
  version "0.12.0-dev.3191+9cf28d1e9"
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
