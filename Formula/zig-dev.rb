class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "e297de6f8adc5a9250d8229df0ea58cb74cb4769d73da09139a7c414a1c7e19d" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "cfe28a381fd446aa0c45c485f096efa52fb58f5dd6fa022ebaa17bc3025f7de3" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "04cf68b25cec57b73cd52524ab4c6340b24a57ad17573f33d759d86443b3c5b2" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.255+da56727e6.tar.xz"
  version "0.12.0-dev.255+da56727e6"
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
