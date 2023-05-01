class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "43893e6fbbaa14af131eb7a249587a179cbbac9de7ed1e6bb21ddb1a03658250" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "5895f7f2ab89702c956ad22b8f92a52669cbb0db4de45dabf785341b1f1cc887" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "53c4f831f993e7a1b08e45855ed0d4cc7819c25a82953846557ad9ab2bedbb24" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2934+1b432072b.tar.xz"
  version "0.11.0-dev.2934+1b432072b"
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
