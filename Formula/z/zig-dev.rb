class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "bd098c7b7e9f241dade9d78c40ea6fdf76d71adfeb8c23170de1f79e0ec025ab" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "5738e3be4f2ea8816da43a70781324cf9e0d0e9fe24665185abedcb09952c0b7" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "5946a9d8a7f4dd6c94d57696abfdb82669f8622cb51663b9dbd3a01dfb53699d" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.3039+e61acd8eb.tar.xz"
  version "0.14.0-dev.3039+e61acd8eb"
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
