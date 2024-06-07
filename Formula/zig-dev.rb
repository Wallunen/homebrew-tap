class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "8b06ed1091b2269b700b3b07f8e3be3b833000841bae5aa6a09b1a8b4773effd" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "46fae219656545dfaf4dce12fb4e8685cec5b51d721beee9389ab4194d43394c" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "d45312e61ebcc48032b77bc4cf7fd6915c11fa16e4aad116b66c9468211230ea" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.13.0.tar.xz"
  version "0.13.0"
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
