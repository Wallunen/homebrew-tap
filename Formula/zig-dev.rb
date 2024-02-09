class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "9175219b9d02a80274b3630ec2054b06f6b2b9c385c01a66bac168d2d90ee1ca" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "9138b7e3e1de677981042e4bacdf02bd4a4bf4f35c9ee61c53162781f84ab46c" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "a7e7c5e1eed6c7ac00e8082512a40d83bcae77ef6b55ef2909bf40d2ccd8e9d3" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2665+919a3bae1.tar.xz"
  version "0.12.0-dev.2665+919a3bae1"
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
