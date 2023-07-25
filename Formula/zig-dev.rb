class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "6f47e5ae317a1dc97150f7318ade7d939455d81aa4b9d90f408ce6f8e8e7a3ec" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "4847472ee8fe6e82ca6cffb6e2af27514f099a644f93c88f2d31bf977861da51" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "bcda620ba5350260a2d3de9549d7ffc5619e6dc029c9e302a329e70f9920bf59" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.4229+f1bd59876.tar.xz"
  version "0.11.0-dev.4229+f1bd59876"
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
