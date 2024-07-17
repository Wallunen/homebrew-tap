class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "57e86332183bd6b9505891d2499a61917553a037ed6f8611cad82052782de670" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "eb0fcd77b79100084f861e9a5513eb1f05c18ab80443ef562071e035e6c3b9c4" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "cbfaed37d025970e700381d0a96428ce0e689d2978b001cd9fa2deb79e7191d2" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.325+9356cb147.tar.xz"
  version "0.14.0-dev.325+9356cb147"
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
