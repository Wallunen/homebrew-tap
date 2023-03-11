class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "07c5243edabb61aee63fa20c10fe73e3861dc022d6de5e0e6af1591bb9b529ca" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "d3283dbc99d7931ebcaa0ec3273ff46c7c53d1ccf0b01e774cbe4631a2ff15ac" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "c7088e496e5b593ecec046259cd24d082198d6a5f6ab6994385861bfdb25f4b0" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.1928+3169f0529.tar.xz"
  version "0.11.0-dev.1928+3169f0529"
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
