class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "362d3042674aa3a871b46cf740bebdf4d5961a14e27665a86b8ce3c8b18a6c2a" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "ca47e0b8d11c7618d2da8942816b0597dd0ecfbe498325c975a8b2903db50b3d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "64022f165fdc81c43dd8fb8dc7da5823e5a64743b153d45b580181c10694dc5a" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1735+bece97ef2.tar.xz"
  version "0.12.0-dev.1735+bece97ef2"
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
