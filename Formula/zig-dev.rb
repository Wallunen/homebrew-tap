class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "e4cbbf0bcf3bed12225464750e76564cdd354b022663872b9b9d32fd1669273d" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "590522f51b422e339bfcbec98e7e38ea269e2e76630ef98301383d27cec0bab7" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "c21cbf6b2e2a085758734a8c0395979407d2a5fdb27d58a7dc40a4b52dca3edd" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.13.0-dev.365+332fbb4b0.tar.xz"
  version "0.13.0-dev.365+332fbb4b0"
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
