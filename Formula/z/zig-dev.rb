class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "7baf2d7e47190fae8794e124615d068598e5e495944b8f81fbc15e0a9e6f79b1" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "6864e3926da88464601e752084d9ae23678d3f6820aa4c8494c4116dec2c541b" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "e76e6c9d04aabf6044aef63de9d23bd367229e28f4284bb96e7b202815c6392d" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2273+73dcd1914.tar.xz"
  version "0.14.0-dev.2273+73dcd1914"
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
