class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "90f56cf07dd591fa2c290c36e3944c0fc84781cfc90aaecd399c270e98185864" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "0bac58fbbb1c17f90d90b738a873d6e3f9bd3164aa98fc6458d35ee53e2183a5" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "3e90402c8bcb07bbc5e45332c3c8d596999b67a3a98a26d36647e6a910562f01" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.4000+3022c525e.tar.xz"
  version "0.11.0-dev.4000+3022c525e"
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
