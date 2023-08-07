class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "6f02b39cd09d2c4782b9ef514a404df7489d54c069412bb844745b9875159a74" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "78376d375f3919252e66bdca47dc0c5a5175b73406e0d80d3e869f27ca03dfb3" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "c3ca657a7ff8324769c1f96556de5ce05f382b401f2c7a2b37c0b4bd4f532d87" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.17+49244dc0c.tar.xz"
  version "0.12.0-dev.17+49244dc0c"
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
