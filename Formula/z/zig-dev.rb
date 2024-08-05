class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "b75a8a86d1c22024fe23438afcb6f8318ac76e6a24d302efdf45a426de3ce42a" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "f28ef957d0688c6108c466d5f491792b2eb7df0e8abdc992dcd862cf90cd5a6e" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "4f8f212efc0f630540d0221433c119be8bf44ed6dd812c39976b8fe0f7a57b6a" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.841+ea847535f.tar.xz"
  version "0.14.0-dev.841+ea847535f"
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
