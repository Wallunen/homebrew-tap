class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "47a9db74261d8c3284271c6183fe6f9f58687c6fa6b9c6c16e393e719163edfc" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "d23d808d7f5e3b7fef8a0825cbe970a35f7469767c506270ea86e93f4faf8b99" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "b99e546afce2d80125f2ad762d0ce0539881cb96c221b538ffafe1c236920886" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.278+0e8f130ae.tar.xz"
  version "0.12.0-dev.278+0e8f130ae"
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
