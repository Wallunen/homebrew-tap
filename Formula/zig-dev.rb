class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "484114cd29903e0f99ed95803a099be606fc1a3b431d1d5a6489e8fca4c17cce" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "4e43ccf95afd0d17065da37b491049b1a57a9a2f6dc6302b68d22fd88eb01a40" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "79dd1da41319e22647cb12272e9896e2af4c0cc188ac34a201f704ca142821c3" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1726+8b1097083.tar.xz"
  version "0.12.0-dev.1726+8b1097083"
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
