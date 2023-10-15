class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "187066e007c3d097c7d76ba88e4b9174a5197815f8db3eb895c7045bb3fed785" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "face411cb49c0224cccbacd1d5d852548902f81b1ddf06429ef04306e075fe27" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "0b7dc76c52d981dd46637e7238b7db9773870b14db00308b71d0ed491edec8cd" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.926+3be8490d8.tar.xz"
  version "0.12.0-dev.926+3be8490d8"
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
