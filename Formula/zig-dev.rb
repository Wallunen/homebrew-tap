class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "f8fd16a799dfe47e842ff0ba7415eb8f330c3b3041e424676ce62dbf1cc19400" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "49fc4fbb6fbd8c7d6a9ce534deeb6497d60fcc3a2be0531e14ee5690faeca914" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "c73f1118b531ceee9b26cff9bb353b2ea04bb78f7e43b1776ec71dac69e8540e" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1153+45d7dfa83.tar.xz"
  version "0.12.0-dev.1153+45d7dfa83"
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
