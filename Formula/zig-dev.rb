class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "8c8c78712b2034b40d3aa76a28674d829e3a1a07b990c30ca28146b0244777d9" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "cd1746085076d63fe11fda1ededc8beadb1b1f7571fa27f127aa30302b343450" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "634ab12d5199ab7604cd77383f6412f00925079cf9d144dbda135dede6c2fced" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2619+5cf138e51.tar.xz"
  version "0.12.0-dev.2619+5cf138e51"
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
