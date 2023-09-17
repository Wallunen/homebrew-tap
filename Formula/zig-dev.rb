class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "81605efd385f0750b0a6811db21d78ed862d1d270860c847fd84cb2a9e9d910e" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "5cc28ec7e5231c0871b870074b710b4a1d2caa9f6016bb80ab06e0c871b69745" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "33912d37733c204bfdab82dd41b5b8b93f7b0c65aab55ea277bd1bb366cc7f2b" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.390+6df78c3bc.tar.xz"
  version "0.12.0-dev.390+6df78c3bc"
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
