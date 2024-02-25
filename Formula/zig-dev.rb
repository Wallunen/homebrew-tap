class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "c2da75192d30f2069075557ffa26af30a895d3913a0caa8b340668360378ac52" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "322978b87e717886948d77f2d5f84a296884f1000e594f36901ff521ea7de460" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "c6cd3c59891fdad5e3081f178112f29a0eb3aeaa181f853bb4e9072921db2a9d" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2928+6fddc9cd3.tar.xz"
  version "0.12.0-dev.2928+6fddc9cd3"
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
